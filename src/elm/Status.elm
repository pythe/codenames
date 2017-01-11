module Status exposing (status)

import Types exposing (..)
import Html exposing (..)


status : Model -> Html Msg
status model =
    let
        discoveredRatio : List Person -> String
        discoveredRatio people =
            [ List.filter (\(Person _ _ incog) -> not incog)
                >> List.length
                >> toString
            , List.length >> toString
            ]
                |> List.map ((|>) people)
                |> String.join " / "
    in
        div []
            [ div [] [ text <| "Green servers reloaded: " ++ discoveredRatio model.greenServers ]
            , div [] [ text <| "Blue servers reloaded: " ++ discoveredRatio model.blueServers ]
            , div [] [ text <| "Util servers crashed: " ++ discoveredRatio model.bystanders ]
            ]
