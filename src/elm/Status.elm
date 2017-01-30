module Status exposing (view)

import Types exposing (..)
import Html exposing (..)


type alias Status =
    { blue : String
    , green : String
    , util : String
    }


view : Model -> Html Msg
view =
    statusView << viewModel


viewModel : Model -> Status
viewModel model =
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
        { green = discoveredRatio model.greenServers
        , blue = discoveredRatio model.blueServers
        , util = discoveredRatio model.bystanders
        }


statusView : Status -> Html Msg
statusView status =
    div []
        [ div [] [ text <| "Green servers reloaded: " ++ status.green ]
        , div [] [ text <| "Blue servers reloaded: " ++ status.blue ]
        , div [] [ text <| "Util servers crashed: " ++ status.util ]
        ]
