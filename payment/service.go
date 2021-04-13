package payment

import (
	"bwa_crowdfunding/user"
	"bwa_crowdfunding/transaction"

	midtrans "github.com/veritrans/go-midtrans"

	"strconv"
)


type service struct {
	transactionRepository transaction.Repository
	campaignRepository campaign.Repository
}


type Service interface {
	GetPaymentURL(transaction Transaction, user user.User) (string, error)
	ProcessPayment(input transaction.TransactionNotificationInput) error
}

func NewService(transactionRepository transaction.Repository, campaignRepository campaign.Repository) *service {
	return &service{transactionRepository, campaignRepository}
}

func (s *service) GetPaymentURL(transaction Transaction,user user.User) (string, error) {
	midclient := midtrans.NewClient()
    midclient.ServerKey = "SANDS"
    midclient.ClientKey = "SANDS"
    midclient.APIEnvType = midtrans.Sandbox

    snapGateway := midtrans.SnapGateway{
        Client: midclient,
    }

	snapReq := &midtrans.SnapReq{
        TransactionDetails: midtrans.TransactionDetails{
            OrderID: strconv.Itoa(transaction.ID),
            GrossAmt: int64(transaction.Amount),
        },
        CustomerDetail: &midtrans.CustDetail{
            FName: user.Name,
            Email: user.Email,
        },
    }

    snapTokenResp, err := snapGateway.GetToken(snapReq)
	if err != nil {
		return "", err
	}

	return snapTokenResp.RedirectURL, nil
}

func (s *service) ProcessPayment(input transaction.TransactionNotificationInput) error {
	transaction_id, _ := strconv.Atoi(input.OrderID)

	transaction, err := s.transactionRepository.GetByID(transaction_id)
	if err != nil {
		return err
	}

	if input.PaymentType == "credit_card" && input.TransactionStatus == "capture" {
		transaction.Status = "paid"
	} else if  input.TransactionStatus == "settlement" {
		transaction.Status = "paid"
	} else if  input.TransactionStatus == "deny" || input.TransactionStatus == "cancel" || input.TransactionStatus == "expire" {
		transaction.Status = "cancelled"
	}

	updatedTransaction, err := s.transactionRepository.Update(transaction)
	if err != nil {
		return err
	}

	campaign, err := s.campaignRepository.FindByID(updatedTransaction.CampaignID)
	if err != nil {
		return err
	}

	if updatedTransaction.Status == "paid" {
		campaign.BackerCount = campaign.BackerCount + 1
		campaign.CurrentAmount = campaign.CurrentAmount + updatedTransaction.Amount

		_, err := s.campaignRepository.Update(campaign)
		if err != nil {
			return err
		}
	}

	return nil

}