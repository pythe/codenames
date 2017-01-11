module Nameplates exposing (nameplates)

import Types exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Random
import Random.List exposing (shuffle)


nameplates : Model -> Html Msg
nameplates =
    attendees
        >> shuffle
        >> flip Random.step (Random.initialSeed 42)
        >> Tuple.first
        >> List.map nameplate
        >> (::) (h2 [] [ text "Attendees" ])
        >> div []


nameplate : Person -> Html Msg
nameplate (Person role name incognito) =
    case incognito of
        True ->
            button [ onClick (Contact name) ] [ text <| "$:~/ > ssh " ++ name ++ " 'sudo shutdown -r now'" ]

        False ->
            case role of
                Bystander ->
                    button [] [ text <| "Restarted util server" ]

                Prod team ->
                    case team of
                        Red ->
                            button [] [ text <| "Restarted green server" ]

                        Blue ->
                            button [] [ text <| "Restarted blue server" ]

                Assassin ->
                    button [] [ text <| "BITLOCKER ENCRYPTING SYSTEMS" ]


attendees : Model -> List Person
attendees { assassin, blueServers, bystanders, greenServers } =
    assassin :: blueServers ++ bystanders ++ greenServers
