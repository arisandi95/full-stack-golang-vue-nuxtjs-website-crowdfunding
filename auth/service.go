package auth

import (
	"github.com/dgrijalva/jwt-go"
)

type Service interface{
	GenerateToken(userID int) (string, error)
}

type jwtService struct {

}

//sementara harusnya di db
var SECRET_KEY = []byte("SANDS_SECRET_KEY_2021")

func NewService() *jwtService{
	return &jwtService{}
}

func (s *jwtService) GenerateToken(userID int) (string, error) {
	claim := jwt.MapClaims{} //claim atau payload
	claim["user_id"] = userID

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claim)
	signedToken, err := token.SignedString(SECRET_KEY)
	if err != nil {
		return signedToken, err
	}

	return signedToken, nil
}


