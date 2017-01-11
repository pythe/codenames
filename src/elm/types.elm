module Types exposing (..)


type alias Name =
    String


type alias Incognito =
    Bool


type Person
    = Person Role Name Incognito


type Role
    = Bystander
    | Prod Team
    | Assassin


type Team
    = Red
    | Blue


type alias Model =
    { assassin : Person
    , blueServers : List Person
    , bystanders : List Person
    , greenServers : List Person
    }


type Msg
    = Contact Name
    | Nop
