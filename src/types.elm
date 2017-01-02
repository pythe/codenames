module Types exposing (..)


type alias Name =
    String


type Person
    = Incognito Name
    | Bystander Name
    | Agent Team Name
    | Assassin Name


type Team
    = Red
    | Blue


type alias Model =
    { attendees : List Person }
