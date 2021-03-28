package transaction

import (
	"bwa_crowdfunding/campaign"
	"bwa_crowdfunding/user"
	"time"
)

type Transaction struct {
	ID 			int 
	CampaignID 	int 
	UserID 		int 
	Amount 		int 
	Status 		string
	Code 		string
	User		user.User
	Campaign	campaign.Campaign
	CreatedAt 	time.Time
	UpdatedAt 	time.Time
}