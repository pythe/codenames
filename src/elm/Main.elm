module Main exposing (..)

import Types exposing (..)
import Nameplates exposing (nameplates)
import Status exposing (status)
import Person
import Html exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : ( Model, Cmd msg )
init =
    ( { blueServers =
            [ Person (Prod Blue) "tracer" True
            , Person (Prod Blue) "winston" True
            , Person (Prod Blue) "zenyatta" True
            , Person (Prod Blue) "zarya" True
            ]
      , greenServers =
            [ Person (Prod Red) "deckard" True
            , Person (Prod Red) "leah" True
            , Person (Prod Red) "adria" True
            , Person (Prod Red) "hakan" True
            ]
      , bystanders =
            [ Person Bystander "saitama" True
            , Person Bystander "ProdSmith" True
            ]
      , assassin = Person Assassin "hattori" True
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Contact name ->
            let
                people =
                    { assassin = Person.updateIfNecessary name model.assassin
                    , bystanders = List.map (Person.updateIfNecessary name) model.bystanders
                    , blueServers = List.map (Person.updateIfNecessary name) model.blueServers
                    , greenServers = List.map (Person.updateIfNecessary name) model.greenServers
                    }
            in
                ( people, Cmd.none )

        Nop ->
            ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    body []
        [ h1 [] [ text "Sysadmin" ]
        , p [] [ text "Your chief sysadmin was too clever naming the servers. Restart all the green servers before the blues finish, but avoid restarting the util servers. One of the servers contains ransomware; connecting to it will encrypt the entire production cluster!" ]
        , status model
        , nameplates model
        ]
