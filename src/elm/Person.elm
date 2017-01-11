module Person exposing (updateIfNecessary)

import Types exposing (..)


updateIfNecessary : Name -> Person -> Person
updateIfNecessary targetName ((Person role name incognito) as person) =
    case incognito of
        True ->
            if targetName == name then
                Person role name False
            else
                person

        False ->
            person
