module Main exposing (..)

import Types exposing (..)
import Nameplates exposing (nameplates)
import Html exposing (..)


main : Program Never Model msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : ( Model, Cmd msg )
init =
    ( { attendees =
            [ Incognito "Deckard Cain"
            , Incognito "Saitama"
            , Incognito "Agent Smith"
            , Incognito "Hattori Hanzo"
            ]
      }
    , Cmd.none
    )


update : msg -> model -> ( model, Cmd msg )
update msg model =
    ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none


view : Model -> Html msg
view model =
    body []
        [ h1 [] [ text "Codenames" ]
        , p [] [ text "Click the name you think matches to make contact with that person. Be careful, there's an assassin hunting you!" ]
        , nameplates model.attendees
        ]
