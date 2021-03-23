package transaction

import (
	"bwa_crowdfunding/user"
)

type GetCampaignTransactionsInput struct {
	ID int `uri:"id" binding:"required"`
	User user.User
}