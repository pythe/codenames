module Nameplates exposing (nameplates)

import Types exposing (..)
import Html exposing (..)


nameplates : List Person -> Html msg
nameplates people =
    div [] <|
        [ h2 []
            [ text "Attendees" ]
        ]
            ++ List.map nameplate people


nameplate : Person -> Html msg
nameplate attendee =
    case attendee of
        Incognito name ->
            button [] [ text <| "Anon " ++ name ]

        Bystander name ->
            button [] [ text <| "Bystander " ++ name ]

        Agent team name ->
            case team of
                Red ->
                    button [] [ text <| "Agent Red " ++ name ]

                Blue ->
                    button [] [ text <| "Agent Blue " ++ name ]

        Assassin name ->
            button [] [ text <| "Assassin " ++ name ]
