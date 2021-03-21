package transaction

type Transaction struct {
	ID 			int 
	CampaignID 	int 
	UserID 		int 
	Amount 		int 
	Status 		string
	Code 		string
	User		user.User
	CreatedAt 	time.Time
	UpdatedAt 	time.Time
}