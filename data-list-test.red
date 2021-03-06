Red [
    Title:   "Data.List test script"
    Author:  "unchartedworks"
    File: 	 %data-list-test.red
    Tabs:	 4
    Rights:  "unchartedworks. All rights reserved."
    License: "MIT"
]

#include %quick-test/quick-test.red
#include %data-list.red

~~~start-file~~~ "data-list"

===start-group=== "++"
--test-- "[integer!] -> [integer!] -> [string!]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    ys: [1 2 3 4 5 6]
    zs: xs1 ++ xs2
    --assert* [ys == zs]

--test-- "[integer!] -> [string!] -> [string!]"
    xs1: [1 2 3]
    xs2: ["4" "5" "6"]
    ys: [1 2 3 "4" "5" "6"]
    zs: xs1 ++ xs2
    --assert* [ys == zs]

--test-- "[string!] -> [string!] -> [string!]"
    xs1: "abc"
    xs2: "def"
    ys:  "abcdef"
    zs:  xs1 ++ xs2
    --assert* [ys == zs]

--test-- "[integer!] -> string! -> [string!]"
    xs1: [1 2 3]
    xs2: ["abc"]
    ys:  [1 2 3 "abc"]
    zs:   xs1 ++ xs2
    --assert* [ys == zs]

--test-- "[integer!] -> string! -> [string!]"
    xs1: "abc"
    xs2: [1 2 3]
    ys:  "abc123"
    zs:   xs1 ++ xs2
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] -> [integer!] -> [string!]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    ys: [1 2 3 4 5 6 7 8 9]
    zs: xs1 ++ xs2 ++ xs3
    --assert* [ys == zs]

--test-- "[integer!] -> [string!] -> [integer!] -> [string!]"
    xs1: [1 2 3]
    xs2: ["4" "5" "6"]
    xs3: [7 8 9]
    ys: [1 2 3 "4" "5" "6" 7 8 9]
    zs: xs1 ++ xs2 ++ xs3
    --assert* [ys == zs]

--test-- "[[integer!]] -> [integer!] -> [[integer!] | integer!]"
    xs1: [[1] [2] [3]]
    xs2: [4 5 6]
    ys: [[1] [2] [3] 4 5 6]
    zs: xs1 ++ xs2
    --assert* [ys == zs]

===end-group===

===start-group=== "rest"
--test-- "[integer!] -> [integer!]"
    xs: [1 2 3]
    ys: [2 3]
    zs: rest xs
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!]"
    xs: [1]
    ys: []
    zs: rest xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!]"
    xs: ["1" "2" "3"]
    ys: ["2" "3"]
    zs: rest xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!]"
    xs: ["1"]
    ys: []
    zs: rest xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "abc"
    ys: "bc"
    zs: rest xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "a"
    ys: ""
    zs: rest xs
    --assert* [ys == zs]

===end-group===

===start-group=== "init"
--test-- "[integer!] -> [integer!]"
    xs: [1 2 3]
    ys: [1 2]
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

--test-- "[integer!] -> [integer!]"
    xs: [1]
    ys: []
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

--test-- "[string!] -> [string!] 1"
    xs: ["1" "2" "3"]
    ys: ["1" "2"]
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

--test-- "[string!] -> [string!] 2"
    xs: ["1"]
    ys: []
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "ab"
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

--test-- "string! -> string! 2"
    xs: "a"
    ys: ""
    zs1: init xs
    zs2: most xs
    --assert* [ys == zs1]
    --assert* [ys == zs2]

===end-group===

===start-group=== "uncons"
--test-- "[integer!] -> [integer! [integer!]]"
    xs: [1 2 3]
    ys: [1 [2 3]]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!]"
    xs: [1]
    ys: [1 []]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!]"
    xs: ["1" "2" "3"]
    ys: ["1" ["2" "3"]]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!]"
    xs: ["1"]
    ys: ["1" []]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "abc"
    ys: [#"a" "bc"]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "a"
    ys: [#"a" ""]
    zs: uncons xs
    --assert* [ys == zs]

--test-- "[] -> Maybe"
    xs: []
    ys: none
    zs: uncons xs
    --assert* [ys == zs]

--test-- "string! -> Maybe"
    xs: ""
    ys: none
    zs: uncons xs
    --assert* [ys == zs]

===end-group===

===start-group=== "length"
--test-- "[integer!] -> integer!"
    xs: [1 2 3]
    ys: 3
    zs: length xs
    --assert* [ys == zs]

--test-- "[string!] -> integer!"
    xs: ["ab" "cd" "ef"]
    ys: 3
    zs: length xs
    --assert* [ys == zs]

--test-- "[] -> integer!"
    xs: []
    ys: 0
    zs: length xs
    --assert* [ys == zs]

--test-- "string! -> integer!"
    xs: "abcdef"
    ys: 6
    zs: length xs
    --assert* [ys == zs]

--test-- "string! -> integer!"
    xs: ""
    ys: 0
    zs: length xs
    --assert* [ys == zs]

===end-group===

===start-group=== "map"
--test-- "[integer!] -> [string!]"
    xs: [1 2 3]
    ys: ["1" "2" "3"]
    zs: map :to-string xs
    --assert* [ys == zs]

--test-- "[char!] -> [string!]"
    xs: [#"1" #"2" #"3"]
    ys: ["1" "2" "3"]
    zs: map :to-string xs
    --assert* [ys == zs]

--test-- "[integer!] -> [[string!]]"
    xs: [#"1" #"2" #"3"]
    ys: [["1"] ["2"] ["3"]]
    f: func [x][reduce [to-string x]]
    zs: map :f xs
    --assert* [ys == zs]

--test-- "[[integer!]] -> [[integer!]]"
    xs: [[1] [2] [3]]
    ys: [[2] [3] [4]]
    f: func [x][reduce [add first x 1]]
    zs: map :f xs
    --assert* [ys == zs]

--test-- "[[integer!]] -> [[[integer!]]]"
    xs: [[1] [2] [3]]
    ys: [[[2]] [[3]] [[4]]]
    f: func [x][reduce [reduce [add first x 1]]]
    zs: map :f xs
    --assert* [ys == zs]

--test-- "[[string!]] -> [[[string!]]]"
    xs: [["ab"] ["bc"] ["cd"]]
    ys: [[["AB"]] [["BC"]] [["CD"]]]
    f: func [x][reduce [reduce [uppercase first x]]]
    zs: map :f xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "abc"
    ys: "ABC"
    zs: map :uppercase xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "123"
    ys: [1 2 3]
    f: func [x][do (to-string x)]
    zs: map :f xs
    --assert* [ys == zs]    

===end-group===

===start-group=== "reverse'"
--test-- "[integer!] -> [integer!]"
    xs: [1 2 3]
    ys: [3 2 1]
    zs: reverse' xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!] 1"
    xs: ["a" "b" "c"]
    ys: ["c" "b" "a"]
    zs: reverse' xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!] 2"
    xs: []
    ys: []
    zs: reverse' xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "abc"
    ys: "cba"
    zs: reverse' xs
    --assert* [ys == zs]
===end-group===

===start-group=== "intersperse"
--test-- "integer! -> [integer!] -> [integer!]"
     x: 0
    xs: [1 2 3]
    ys: [1 0 2 0 3]
    zs: intersperse x xs
    --assert* [ys == zs]

--test-- "char! -> string! -> string!"
     x: #","
    xs: "abc"
    ys: "a,b,c"
    zs: intersperse x xs
    --assert* [ys == zs]

===end-group===

===start-group=== "transpose"
--test-- "[[integer!]] -> [[integer!]] -> [[string!]] 1"
    xss:  []
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[string!]] 2"
    xss:  [[] [] []]
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[string!]] 3"
    xss:  [[1] [3] [6]]
    yss:  [[1 3 6]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[string!]] 4"
    xss:  [[1 2 3] [4 5 6]]
    yss:  [[1 4] [2 5] [3 6]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[string!]] 5"
    xss:  [[1 2 3] [4 5 6] 6]
    yss:  none
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 1"
    xss:  []
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 2"
    xss:  [[] [] []]
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 3"
    xss:  [["1"] ["3"] ["6"]]
    yss:  [["1" "3" "6"]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 4"
    xss:  [["1" "2" "3"] ["4" "5" "6"]]
    yss:  [["1" "4"] ["2" "5"] ["3" "6"]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 5"
    xss:  [["1" "2" "3"] ["4" "5" "6"] "6"]
    yss:  none
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 1"
    xss:  []
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 2"
    xss:  [[] [] []]
    yss:  []
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 3"
    xss:  [["1"] ["3"] ["6"]]
    yss:  [["1" "3" "6"]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 4"
    xss:  [["1" "2" "3"] [4 5 6]]
    yss:  [["1" 4] ["2" 5] ["3" 6]]
    zss:  (transpose xss)
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 5"
    xss:  [["1" "2" "3"] [4 5 6] "6"]
    yss:  none
    zss:  (transpose xss)
    --assert* [yss == zss]

===end-group===

===start-group=== "subsequences"

--test-- "[integer!] -> [[integer!]] 1"
    xs1: []
    ys1: [[]]
    zs1: subsequences xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [[integer!]] 2"
    xs2: [1]
    ys2: [[] [1]]
    zs2: subsequences xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [[integer!]] 3"
    xs3: [1 2]
    ys3: [[] [1] [2] [1 2]]
    zs3: subsequences xs3
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [[integer!]] 4"
    xs4: [1 2 3]
    ys4: [[] [1] [2] [1 2] [3] [1 3] [2 3] [1 2 3]]
    zs4: subsequences xs4
    --assert* [ys4 == zs4]

--test-- "[string!] -> [[string!]] 1"
    xs1: []
    ys1: [[]]
    zs1: subsequences xs1
    --assert* [ys1 == zs1]

--test-- "[string!] -> [[string!]] 2"
    xs2: ["1"]
    ys2: [[] ["1"]]
    zs2: subsequences xs2
    --assert* [ys2 == zs2]

--test-- "[string!] -> [[string!]] 3"
    xs3: ["1" "2"]
    ys3: [[] ["1"] ["2"] ["1" "2"]]
    zs3: subsequences xs3
    --assert* [ys3 == zs3]

--test-- "[string!] -> [[string!]] 4"
    xs4: ["1" "2" "3"]
    ys4: [[] ["1"] ["2"] ["1" "2"] ["3"] ["1" "3"] ["2" "3"] ["1" "2" "3"]]
    zs4: subsequences xs4
    --assert* [ys4 == zs4]

--test-- "[string! | integer!] -> [[string! | integer!]] 1"
    xs1: []
    ys1: [[]]
    zs1: subsequences xs1
    --assert* [ys1 == zs1]

--test-- "[string! | integer!] -> [[string! | integer!]] 2"
    xs2: ["1"]
    ys2: [[] ["1"]]
    zs2: subsequences xs2
    --assert* [ys2 == zs2]

--test-- "[string! | integer!] -> [[string! | integer!]] 3"
    xs3: ["1" 2]
    ys3: [[] ["1"] [2] ["1" 2]]
    zs3: subsequences xs3
    --assert* [ys3 == zs3]

--test-- "[string! | integer!] -> [[string! | integer!]] 4"
    xs4: ["1" 2 "3"]
    ys4: [[] ["1"] [2] ["1" 2] ["3"] ["1" "3"] [2 "3"] ["1" 2 "3"]]
    zs4: subsequences xs4
    --assert* [ys4 == zs4]

--test-- "string! -> [[string!] 1"
    xs1: ""
    ys1: [""]
    zs1: subsequences xs1
    --assert* [ys1 == zs1]

--test-- "string! -> [[string!] 2"
    xs2: "ab"
    ys2: ["" "a" "b" "ab"]
    zs2: subsequences xs2
    --assert* [ys2 == zs2]

--test-- "string! -> [[string!] 3"
    xs3: "abc"
    ys3: ["" "a" "b" "ab" "c" "ac" "bc" "abc"]
    zs3: subsequences xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "permutations"

--test-- "[integer!] -> [[integer!]] 1"
    xs1: []
    ys1: [[]]
    zs1: permutations xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [[integer!]] 2"
    xs2: [1]
    ys2: [[1]]
    zs2: permutations xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [[integer!]] 3"
    xs3: [1 2]
    ys3: [[1 2] [2 1]]
    zs3: permutations xs3
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [[integer!]] 4"
    xs4: [1 2 3]
    ys4: [[1 2 3] [2 1 3] [2 3 1] [1 3 2] [3 1 2] [3 2 1]]
    zs4: permutations xs4
    --assert* [ys4 == zs4]

--test-- "[string!] -> [[string!]] 1"
    xs1: []
    ys1: [[]]
    zs1: permutations xs1
    --assert* [ys1 == zs1]

--test-- "[string!] -> [[string!]] 2"
    xs2: ["1"]
    ys2: [["1"]]
    zs2: permutations xs2
    --assert* [ys2 == zs2]

--test-- "[string!] -> [[string!]] 3"
    xs3: ["1" "2"]
    ys3: [["1" "2"] ["2" "1"]]
    zs3: permutations xs3
    --assert* [ys3 == zs3]

--test-- "[string!] -> [[string!]] 4"
    xs4: ["1" "2" "3"]
    ys4: [["1" "2" "3"] ["2" "1" "3"] ["2" "3" "1"] ["1" "3" "2"] ["3" "1" "2"] ["3" "2" "1"]]
    zs4: permutations xs4
    --assert* [ys4 == zs4]

--test-- "[string! | integer!] -> [[string! | integer!]] 1"
    xs1: []
    ys1: [[]]
    zs1: permutations xs1
    --assert* [ys1 == zs1]

--test-- "[string! | integer!] -> [[string! | integer!]] 2"
    xs2: ["1"]
    ys2: [["1"]]
    zs2: permutations xs2
    --assert* [ys2 == zs2]

--test-- "[string! | integer!] -> [[string! | integer!]] 3"
    xs3: ["1" 2]
    ys3: [["1" 2] [2 "1"]]
    zs3: permutations xs3
    --assert* [ys3 == zs3]

--test-- "[string! | integer!] -> [[string! | integer!]] 4"
    xs4: ["1" 2 "3"]
    ys4: [["1" 2 "3"] [2 "1" "3"] [2 "3" "1"] ["1" "3" 2] ["3" "1" 2] ["3" 2 "1"]]
    zs4: permutations xs4
    --assert* [ys4 == zs4]

--test-- "string! -> [[string!] 1"
    xs1: ""
    ys1: [""]
    zs1: permutations xs1
    --assert* [ys1 == zs1]

--test-- "string! -> [[string!] 2"
    xs2: "ab"
    ys2: ["ab" "ba"]
    zs2: permutations xs2
    --assert* [ys2 == zs2]

--test-- "string! -> [[string!] 3"
    xs3: "abc"
    ys3: ["abc" "bac" "bca" "acb" "cab" "cba"]
    zs3: permutations xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "reduce-deep"

--test-- "[[[integer] [integer!]]] -> [[[integer] [integer!]]]"
    xss: [add 1 2 add 3 4 add 3 4 add 5 6]
    yss: [3 7 7 11]
    zss: reduce-deep xss
    --assert* [yss == zss]

--test-- "[[[integer] [integer!]]] -> [[[integer] [integer!]]]"
    xss: [[add 1 2 add 3 4] [add 3 4 add 5 6]]
    yss: [[3 7] [7 11]]
    zss: reduce-deep xss
    --assert* [yss == zss]

--test-- "[[[integer] [integer!]]] -> [[[integer] [integer!]]]"
    xss: [[[add 1 2 add 3 4]] [[add 3 4 add 5 6]]]
    yss: [[[3 7]] [[7 11]]]
    zss: reduce-deep xss
    --assert* [yss == zss]

--test-- "[[[[integer] [integer!]]]] -> [[[[integer] [integer!]]]]"
    xss: [[[[add 1 2 add 3 4]]] [[[add 3 4 add 5 6]]]]
    yss: [[[[3 7]]] [[[7 11]]]]
    zss: reduce-deep xss
    --assert* [yss == zss]
===end-group===

===start-group=== "foldl"

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 1"
    xs: [1 2 3]
    ys: 6
    f: func [y x][x + y]
    zs: foldl :f 0 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 2"
    xs: [1 2 3 4]
    ys: 24
    f: func [y x][x * y]
    zs: foldl :f 1 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 2"
    xs: [1 2 3 4]
    ys: [[1] [2] [3] [4]]
    f: func [y x][y ++ (reduce [reduce [x]])]
    zs: foldl :f [] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "foldl1"
--test-- "(integer! -> integer! -> integer!) -> [integer!] -> integer! 1"
    xs1: []
    ys1: none
    zs1: foldl1 :add xs1
    --assert* [ys1 == zs1]

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> integer! 2"
    xs2: [1 2 3]
    ys2: 6
    zs2: foldl1 :add xs2
    --assert* [ys2 == zs2]

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> integer! 3"
    xs: [1 2 3 4]
    ys: 24
    zs: foldl1 :multiply xs
    --assert* [ys == zs]

===end-group===

===start-group=== "foldr"

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 1"
    xs: [1 2 3]
    ys: 6
    f: func [x y][x + y]
    zs: foldr :f 0 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 2"
    xs: [1 2 3 4]
    ys: 24
    f: func [x y][x * y]
    zs: foldr :f 1 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 3"
    xs: [1 2 3 4]
    ys: [[1] [2] [3] [4]]
    f: func [x y][(reduce [reduce [x]]) ++ y]
    zs: foldr :f [] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "foldr1"
--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 1"
    xs1: []
    ys1: none
    zs1: foldr1 :add xs1
    --assert* [ys1 == zs1]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 2"
    xs2: [1 2 3]
    ys2: 6
    zs2: foldr1 :add xs2
    --assert* [ys2 == zs2]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> integer! 3"
    xs: ["1" "2" "3" "4"]
    ys: "1234"
    f: func [x y][ x ++ y]
    zs: foldr1 :f xs
    --assert* [ys == zs]

===end-group===

===start-group=== "concat"
--test-- "[[integer!]] -> [integer!] 1"
    xs1: []
    ys1: []
    zs1: concat xs1
    --assert* [ys1 == zs1]

--test-- "[[integer!]] -> [integer!] 2"
    xs2: [[1] [2] [3]]
    ys2: [1 2 3]
    zs2: concat xs2
    --assert* [ys2 == zs2]

--test-- "[[string!]] -> [string!] 1"
    xs1: []
    ys1: []
    zs1: concat xs1
    --assert* [ys1 == zs1]

--test-- "[[string!]] -> [string!] 2"
    xs2: [["1"] ["2"] ["3"]]
    ys2: ["1" "2" "3"]
    zs2: concat xs2
    --assert* [ys2 == zs2]

--test-- "[string!] -> string!"
    xs: ["1" "2" "3"]
    ys: "123"
    zs: concat xs
    --assert* [ys == zs]

===end-group===

===start-group=== "concatMap"
--test-- "(integer! -> [integer!]) -> [integer!] -> [integer!]"
    xs: [1 2 3]
    ys: [1 2 3]
    zs: concatMap func [x][reduce [x]] xs
    --assert* [ys == zs]

--test-- "(string! -> [string!]) -> [string!] -> [string!]"
    xs: ["1" "2" "3"]
    ys: ["1" "1" "2" "2" "3" "3"]
    zs: concatMap func [x][reduce [x x]] xs
    --assert* [ys == zs]

--test-- "(character! -> string!) -> string! -> string!"
    xs: "abc"
    ys: "aabbcc"
    zs: concatMap func [x][(to-string x) ++ (to-string x)] xs
    --assert* [ys == zs]

--test-- "(character! -> string!) -> string! -> string!"
    xs: "abc"
    ys: ["a" "a" "b" "b" "c" "c"]
    zs: concatMap func [x][reduce [(to-string x) (to-string x)]] xs
    --assert* [ys == zs]
    
===end-group===

===start-group=== "and'"

--test-- "[logic!] -> logic! 1"
    xs: []
    y: true
    z: and' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 2"
    xs: [false false]
    y: false
    z: and' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 3"
    xs: [false true]
    y: false
    z: and' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 4"
    xs: [true false]
    y: false
    z: and' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 5"
    xs: [true true]
    y: true
    z: and' xs
    --assert* [y == z]

===end-group===

===start-group=== "or'"

--test-- "[logic!] -> logic! 1"
    xs: []
    y: false
    z: or' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 2"
    xs: [false false]
    y: false
    z: or' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 3"
    xs: [false true]
    y: true
    z: or' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 4"
    xs: [true false]
    y: true
    z: or' xs
    --assert* [y == z]

--test-- "[logic!] -> logic! 5"
    xs: [true true]
    y: true
    z: or' xs
    --assert* [y == z]

===end-group===

===start-group=== "any'"

--test-- "(integer! -> logic!) -> [integer!] -> logic! 1"
    xs: []
    y: false
    z: any' func [x][x > 1] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 2"
    xs: [1 2 3]
    y: true
    z: any' func [x][x > 1] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 3"
    xs: [1 2 3]
    y: false
    z: any' :negative? xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 4"
    xs: [1 -2 3]
    y: true
    z: any' :negative? xs
    --assert* [y == z]

===end-group===

===start-group=== "all'"

--test-- "(integer! -> logic!) -> [integer!] -> logic! 1"
    xs: []
    y: true
    z: all' func [x][x > 1] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 2"
    xs: [1 2 3]
    y: true
    z: all' func [x][x > 0] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 3"
    xs: [1 2 3]
    y: false
    z: all' :negative? xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> logic! 4"
    xs: [1 -2 3]
    y: true
    z: all' :integer? xs
    --assert* [y == z]

===end-group===

===start-group=== "sum"
--test-- "[integer!] -> integer! 1"
    xs1: []
    ys1: 0
    zs1: sum xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> integer! 2"
    xs2: [1]
    ys2: 1
    zs2: sum xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> integer! 3"
    xs3: [1 2 3 4]
    ys3: 10
    zs3: sum xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "product"

--test-- "[integer!] -> integer! 1"
    xs1: []
    ys1: 1
    zs1: product xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> integer! 2"
    xs2: [1]
    ys2: 1
    zs2: product xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> integer! 3"
    xs3: [1 2 3 4]
    ys3: 24
    zs3: product xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "maximum"

--test-- "[integer!] -> integer! 1"
    xs1: []
    ys1: none
    zs1: maximum xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> integer! 2"
    xs2: [1]
    ys2: 1
    zs2: maximum xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> integer! 3"
    xs3: [1 2 3 4]
    ys3: 4
    zs3: maximum xs3
    --assert* [ys3 == zs3]

--test-- "[string!] -> string! 1"
    xs1: []
    ys1: none
    zs1: maximum xs1
    --assert* [ys1 == zs1]

--test-- "[string!] -> string! 2"
    xs2: ["1"]
    ys2: none
    zs2: maximum xs2
    --assert* [ys2 == zs2]

--test-- "[string!] -> string! 3"
    xs3: ["1" 2 3 4]
    ys3: none
    zs3: maximum xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "minimum"

--test-- "[integer!] -> integer! 1"
    xs1: []
    ys1: none
    zs1: minimum xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> integer! 2"
    xs2: [1]
    ys2: 1
    zs2: minimum xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> integer! 3"
    xs3: [1 2 3 4]
    ys3: 1
    zs3: minimum xs3
    --assert* [ys3 == zs3]

--test-- "[string!] -> string 1!"
    xs1: []
    ys1: none
    zs1: minimum xs1
    --assert* [ys1 == zs1]

--test-- "[string!] -> string 2!"
    xs2: ["1"]
    ys2: none
    zs2: minimum xs2
    --assert* [ys2 == zs2]

--test-- "[string!] -> string 3!"
    xs3: ["1" 2 3 4]
    ys3: none
    zs3: minimum xs3
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "scanl"

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [0 1 3 6]
    f: func [y x][x + y]
    zs: scanl :f 0 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 2"
    xs: [1 2 3 4]
    ys: [1 1 2 6 24]
    f: func [y x][x * y]
    zs: scanl :f 1 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 3"
    xs: [1 2 3 4]
    ys: [[] [1] [1 2] [1 2 3] [1 2 3 4]]
    f: func [y x][y ++ (reduce [x])]
    zs: scanl :f [] xs
    --assert* [ys == zs]

--test-- "(string! -> char! -> string!) -> string! -> [string!]"
    xs: "abc"
    ys: ["" "a" "ab" "abc"]
    f: func [y x][y ++ (reduce [x])]
    zs: scanl :f "" xs
    --assert* [ys == zs]

===end-group===

===start-group=== "scanl1"

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [1 3 6]
    f: func [y x][x + y]
    zs: scanl1 :f xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> [integer!] 2"
    xs: [1 2 3 4]
    ys: [1 2 6 24]
    f: func [y x][x * y]
    zs: scanl1 :f xs
    --assert* [ys == zs]
===end-group===

 ===start-group=== "scanr"

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [6 5 3 0]
    f: func [x y][x + y]
    zs: scanr :f 0 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 2"
    xs: [1 2 3 4]
    ys: [24 24 12 4 1]
    f: func [x y][x * y]
    zs: scanr :f 1 xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> integer! -> [integer!] -> [integer!] 3"
    xs: [1 2 3 4]
    ys: [[4 3 2 1] [4 3 2] [4 3] [4] []]
    f: func [x y][y ++ (reduce [x])]
    zs: scanr :f [] xs
    --assert* [ys == zs]

--test-- "(char! -> string! -> string!) -> string! -> [string!] -> [string!]"
    xs: "abc"
    ys: ["abc" "bc" "c" ""]
    f: func [x y][(to-string x) ++ y]
    zs: scanr :f "" xs
    --assert* [ys == zs]

 ===end-group===

===start-group=== "scanr1"

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [6 5 3]
    f: func [x y][x + y]
    zs: scanr1 :f xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> integer!) -> [integer!] -> [integer!] 2"
    xs: [1 2 3 4]
    ys: [24 24 12 4]
    f: func [x y][x * y]
    zs: scanr1 :f xs
    --assert* [ys == zs]

===end-group===

===start-group=== "replicate"

--test-- "integer! -> integer! -> [integer!] 1"
    ys1: []
    zs1: replicate 0 1
    --assert* [ys1 == zs1]

--test-- "integer! -> integer! -> [integer!] 2"
    ys2: [1]
    zs2: replicate 1 1
    --assert* [ys2 == zs2]

--test-- "integer! -> integer! -> [integer!] 3"
    ys3: [1 1]
    zs3: replicate 2 1
    --assert* [ys3 == zs3]

--test-- "integer! -> string! -> [string!] 1"
    ys1: []
    zs1: replicate 0 "abc"
    --assert* [ys1 == zs1]

--test-- "integer! -> string! -> [string!] 2"
    ys2: ["abc"]
    zs2: replicate 1 "abc"
    --assert* [ys2 == zs2]

--test-- "integer! -> string! -> [string!] 3"
    ys3: ["abc" "abc"]
    zs3: replicate 2 "abc"
    --assert* [ys3 == zs3]

--test-- "integer! -> char! -> string! 1"
    ys1: ""
    zs1: replicate 0 #"a"
    --assert* [ys1 == zs1]

--test-- "integer! -> char! -> string! 2"
    ys2: "a"
    zs2: replicate 1 #"a"
    --assert* [ys2 == zs2]

--test-- "integer! -> char! -> string! 3"
    ys3: "aa"
    zs3: replicate 2 #"a"
    --assert* [ys3 == zs3]

===end-group===

===start-group=== "take'"

--test-- "integer! -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: []
    zs1: take' 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> [integer!] -> [integer!] 2"
    ys2: [1]
    zs2: take' 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> [integer!] -> [integer!] 3"
    ys3: [1 2]
    zs3: take' 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> [integer!] -> [integer!] 4"
    ys4: [1 2 3]
    zs4: take' 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> [integer!] -> [integer!] 5"
    ys5: [1 2 3]
    zs5: take' 4 xs
    --assert* [ys5 == zs5]

--test-- "integer! -> string! -> string! 1"
    xs:  "abc"
    ys1: ""   
    zs1: take' 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> string! -> string! 2"
    ys2: "a"  
    zs2: take' 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> string! -> string! 3"
    ys3: "ab" 
    zs3: take' 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> string! -> string! 4"
    ys4: "abc"
    zs4: take' 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> string! -> string! 5"
    ys5: "abc"
    zs5: take' 4 xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "drop"

--test-- "integer! -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: [1 2 3]
    zs1: drop 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> [integer!] -> [integer!] 2"
    ys2: [2 3]
    zs2: drop 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> [integer!] -> [integer!] 3"
    ys3: [3]
    zs3: drop 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> [integer!] -> [integer!] 4"
    ys4: []
    zs4: drop 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> [integer!] -> [integer!] 5"
    ys5: []
    zs5: drop 4 xs
    --assert* [ys5 == zs5]

--test-- "integer! -> string! -> string! 1"
    xs:  "abc"
    ys1: "abc"   
    zs1: drop 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> string! -> string! 2"
    ys2: "bc"  
    zs2: drop 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> string! -> string! 3"
    ys3: "c" 
    zs3: drop 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> string! -> string! 4"
    ys4: ""
    zs4: drop 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> string! -> string! 5"
    ys5: ""
    zs5: drop 4 xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "splitAt"

--test-- "integer! -> [integer!] -> [[integer!]] 1"
    xs:  [1 2 3]
    ys1: [[] [1 2 3]]
    zs1: splitAt 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> [integer!] -> [[integer!]] 2"
    ys2: [[1] [2 3]]
    zs2: splitAt 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> [integer!] -> [[integer!]] 3"
    ys3: [[1 2] [3]]
    zs3: splitAt 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> [integer!] -> [[integer!]] 4"
    ys4: [[1 2 3] []]
    zs4: splitAt 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> [integer!] -> [[integer!]] 5"
    ys5: [[1 2 3] []]
    zs5: splitAt 4 xs
    --assert* [ys5 == zs5]

--test-- "integer! -> string! -> [string!] 1"
    xs:  "abc"
    ys1: ["" "abc"]   
    zs1: splitAt 0 xs
    --assert* [ys1 == zs1]

--test-- "integer! -> string! -> [string!] 2"
    ys2: ["a" "bc"] 
    zs2: splitAt 1 xs
    --assert* [ys2 == zs2]

--test-- "integer! -> string! -> [string!] 3"
    ys3: ["ab" "c"]
    zs3: splitAt 2 xs
    --assert* [ys3 == zs3]

--test-- "integer! -> string! -> [string!] 4"
    ys4: ["abc" ""]
    zs4: splitAt 3 xs
    --assert* [ys4 == zs4]

--test-- "integer! -> string! -> [string!] 5"
    ys5: ["abc" ""]
    zs5: splitAt 4 xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "takeWhile"

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: [1 2 3]
    zs1: takeWhile :positive? xs
    --assert* [ys1 == zs1]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 2"
    ys2: []
    zs2: takeWhile func[x][x < 1] xs
    --assert* [ys2 == zs2]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 3"
    ys3: [1]
    zs3: takeWhile func[x][x < 2] xs
    --assert* [ys3 == zs3]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 4"
    ys4: [1 2]
    zs4: takeWhile func[x][x < 3] xs
    --assert* [ys4 == zs4]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 5"
    ys5: [1 2 3]
    zs5: takeWhile func[x][x < 4] xs
    --assert* [ys5 == zs5]

--test-- "(char! -> logic!) -> string! -> string! 1"
    xs:  "abc"
    ys1: ""   
    zs1: takeWhile func [x][x < #"a"] xs
    --assert* [ys1 == zs1]

--test-- "(char! -> logic!) -> string! -> string! 2"
    ys2: "a"  
    zs2: takeWhile func [x][x < #"b"] xs
    --assert* [ys2 == zs2]

--test-- "(char! -> logic!) -> string! -> string! 3"
    ys3: "ab" 
    zs3: takeWhile func [x][x < #"c"] xs
    --assert* [ys3 == zs3]

--test-- "(char! -> logic!) -> string! -> string! 4"
    ys4: "abc"
    zs4: takeWhile func [x][x < #"d"] xs
    --assert* [ys4 == zs4]

--test-- "(char! -> logic!) -> string! -> string! 5"
    ys5: "abc"
    zs5: takeWhile func [x][x < #"e"] xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "dropWhile"

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: []
    zs1: dropWhile :positive? xs
    --assert* [ys1 == zs1]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    ys2: [1 2 3]
    zs2: dropWhile func[x][x < 1] xs
    --assert* [ys2 == zs2]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    ys3: [2 3]
    zs3: dropWhile func[x][x < 2] xs
    --assert* [ys3 == zs3]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    ys4: [3]
    zs4: dropWhile func[x][x < 3] xs
    --assert* [ys4 == zs4]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    ys5: []
    zs5: dropWhile func[x][x < 4] xs
    --assert* [ys5 == zs5]

--test-- "(char! -> logic!) -> string! -> string! 1"
    xs:  "abc"
    ys1: "abc"   
    zs1: dropWhile func [x][x < #"a"] xs
    --assert* [ys1 == zs1]

--test-- "(char! -> logic!) -> string! -> string! 2"
    ys2: "bc"  
    zs2: dropWhile func [x][x < #"b"] xs
    --assert* [ys2 == zs2]

--test-- "(char! -> logic!) -> string! -> string! 3"
    ys3: "c" 
    zs3: dropWhile func [x][x < #"c"] xs
    --assert* [ys3 == zs3]

--test-- "(char! -> logic!) -> string! -> string! 4"
    ys4: ""
    zs4: dropWhile func [x][x < #"d"] xs
    --assert* [ys4 == zs4]

--test-- "(char! -> logic!) -> string! -> string! 5"
    ys5: ""
    zs5: dropWhile func [x][x < #"e"] xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "dropWhileEnd"

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: []
    zs1: dropWhileEnd :positive? xs
    --assert* [ys1 == zs1]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 2"
    ys2: [1 2 3]
    zs2: dropWhileEnd func [x][x < 1] xs
    --assert* [ys2 == zs2]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 3"
    ys3: [1 2 3]
    zs3: dropWhileEnd func [x][x < 2] xs
    --assert* [ys3 == zs3]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 4"
    ys4: [1 2 3]
    zs4: dropWhileEnd func [x][x < 3] xs
    --assert* [ys4 == zs4]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 5"
    ys5: []
    zs5: dropWhileEnd func [x][x < 4] xs
    --assert* [ys5 == zs5]

--test-- "(char! -> logic!) -> string! -> string! 1"
    xs:  "abc"
    ys1: "abc"   
    zs1: dropWhileEnd func [x][x < #"a"] xs
    --assert* [ys1 == zs1]

--test-- "(char! -> logic!) -> string! -> string! 2"
    ys2: "abc"  
    zs2: dropWhileEnd func [x][x < #"b"] xs
    --assert* [ys2 == zs2]

--test-- "(char! -> logic!) -> string! -> string! 3"
    ys3: "abc" 
    zs3: dropWhileEnd func [x][x < #"c"] xs
    --assert* [ys3 == zs3]

--test-- "(char! -> logic!) -> string! -> string! 4"
    ys4: ""
    zs4: dropWhileEnd func [x][x < #"d"] xs
    --assert* [ys4 == zs4]

--test-- "(char! -> logic!) -> string! -> string! 5"
    ys5: ""
    zs5: dropWhileEnd func [x][x < #"e"] xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "span"

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!] 1"
    xs:  [1 2 3]
    ys1: [[1 2 3] []]
    zs1: span :positive? xs
    --assert* [ys1 == zs1]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!] 2"
    ys2: [[] [1 2 3]]
    zs2: span func [x][x < 1] xs
    --assert* [ys2 == zs2]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!] 3"
    ys3: [[1] [2 3]]
    zs3: span func [x][x < 2] xs
    --assert* [ys3 == zs3]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!] 4"
    ys4: [[1 2] [3]]
    zs4: span func [x][x < 3] xs
    --assert* [ys4 == zs4]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!] 5"
    ys5: [[1 2 3] []]
    zs5: span func [x][x < 4] xs
    --assert* [ys5 == zs5]

--test-- "(char! -> logic!) -> string! -> [[string!]] 1"
    xs:  "abc"
    ys1: ["" "abc"]
    zs1: span func [x][x < #"a"] xs
    --assert* [ys1 == zs1]

--test-- "(char! -> logic!) -> string! -> [[string!]] 2"
    ys2: ["a" "bc"]
    zs2: span func [x][x < #"b"] xs
    --assert* [ys2 == zs2]

--test-- "(char! -> logic!) -> string! -> [[string!]] 3"
    ys3: ["ab" "c"]
    zs3: span func [x][x < #"c"] xs
    --assert* [ys3 == zs3]

--test-- "(char! -> logic!) -> string! -> [[string!]] 4"
    ys4: ["abc" ""]
    zs4: span func [x][x < #"d"] xs
    --assert* [ys4 == zs4]

--test-- "(char! -> logic!) -> string! -> [[string!]] 5"
    ys5: ["abc" ""]
    zs5: span func [x][x < #"e"] xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "break'"

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 1"
    xs:  [1 2 3]
    ys1: [[] [1 2 3]]
    zs1: break' :positive? xs
    --assert* [ys1 == zs1]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 2"
    ys2: [[1] [2 3]]
    zs2: break' func [x][x > 1] xs
    --assert* [ys2 == zs2]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 3"
    ys3: [[1 2] [3]]
    zs3: break' func [x][x > 2] xs
    --assert* [ys3 == zs3]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 4"
    ys4: [[1 2 3] []]
    zs4: break' func [x][x > 3] xs
    --assert* [ys4 == zs4]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 5"
    ys5: [[1 2 3] []]
    zs5: break' func [x][x > 4] xs
    --assert* [ys5 == zs5]

--test-- "(char! -> logic!) -> string! -> [[string!]] 1"
    xs:  "abc"
    ys1: ["" "abc"]
    zs1: break' func [x][x >= #"a"] xs
    --assert* [ys1 == zs1]

--test-- "(char! -> logic!) -> string! -> [[string!]] 2"
    ys2: ["a" "bc"]
    zs2: break' func [x][x >= #"b"] xs
    --assert* [ys2 == zs2]

--test-- "(char! -> logic!) -> string! -> [[string!]] 3"
    ys3: ["ab" "c"]
    zs3: break' func [x][x >= #"c"] xs
    --assert* [ys3 == zs3]

--test-- "(char! -> logic!) -> string! -> [[string!]] 4"
    ys4: ["abc" ""]
    zs4: break' func [x][x >= #"d"] xs
    --assert* [ys4 == zs4]

--test-- "(char! -> logic!) -> string! -> [[string!]] 5"
    ys5: ["abc" ""]
    zs5: break' func [x][x >= #"e"] xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "stripPrefix"

--test-- "[integer!] -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys1: [1 2 3]
    zs1: stripPrefix [] xs
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [integer!] -> [integer!] 2"
    ys2: [2 3]
    zs2: stripPrefix [1] xs
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [integer!] -> [integer!] 3"
    ys3: [3]
    zs3: stripPrefix [1 2] xs
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [integer!] -> [integer!] 4"
    ys4: []
    zs4: stripPrefix [1 2 3] xs
    --assert* [ys4 == zs4]

--test-- "[integer!] -> [integer!] -> [integer!] 5"
    ys5: none
    zs5: stripPrefix [1 2 3 4] xs
    --assert* [ys5 == zs5]


--test-- "string! -> string! -> string! 1"
    xs:  "abc"
    ys1: "abc"
    zs1: stripPrefix "" xs
    --assert* [ys1 == zs1]

--test-- "string! -> string! -> string! 2"
    ys2: "bc"
    zs2: stripPrefix "a" xs
    --assert* [ys2 == zs2]

--test-- "string! -> string! -> string! 3"
    ys3: "c"
    zs3: stripPrefix "ab" xs
    --assert* [ys3 == zs3]

--test-- "string! -> string! -> string! 4"
    ys4: ""
    zs4: stripPrefix "abc" xs
    --assert* [ys4 == zs4]

--test-- "string! -> string! -> string! 5"
    ys5: none
    zs5: stripPrefix "abcd" xs
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "group"

--test-- "[integer!] -> [[integer!] 1"
    xs1: []
    ys1: []
    zs1: group xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [[integer!] 2"
    xs2: [1]
    ys2: [[1]]
    zs2: group xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [[integer!] 3"
    xs3: [1 2]
    ys3: [[1] [2]]
    zs3: group xs3
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [[integer!] 4"
    xs4: [1 2 3 3 2]
    ys4: [[1] [2] [3 3] [2]]
    zs4: group xs4
    --assert* [ys4 == zs4]

--test-- "[integer!] -> [[integer!] 5"
    xs5: [1 1 2 1]
    ys5: [[1 1] [2] [1]]
    zs5: group xs5
    --assert* [ys5 == zs5]

--test-- "string! -> [string!] 1"
    xs1: ""
    ys1: []
    zs1: group xs1
    --assert* [ys1 == zs1]

--test-- "string! -> [string!] 2"
    xs2: "abc"
    ys2: ["a" "b" "c"]
    zs2: group xs2
    --assert* [ys2 == zs2]

--test-- "string! -> [string!] 3"
    xs3: "abba"
    ys3: ["a" "bb" "a"]
    zs3: group xs3
    --assert* [ys3 == zs3]

--test-- "string! -> [string!] 4"
    xs4: "abcdd"
    ys4: ["a" "b" "c" "dd"]
    zs4: group xs4
    --assert* [ys4 == zs4]

--test-- "string! -> [string!] 5"
    xs5: "aabcdd"
    ys5: ["aa" "b" "c" "dd"]
    zs5: group xs5
    --assert* [ys5 == zs5]

===end-group===

===start-group=== "inits"

--test-- "[integer!] -> [[integer!] 1"
    xs1: []
    ys1: [[]]
    zs1: inits xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [[integer!] 2"
    xs2: [1]
    ys2: [[] [1]]
    zs2: inits xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [[integer!] 3"
    xs3: [1 2]
    ys3: [[] [1] [1 2]]
    zs3: inits xs3
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [[integer!] 4"
    xs4: [1 2 3]
    ys4: [[] [1] [1 2] [1 2 3]]
    zs4: inits xs4
    --assert* [ys4 == zs4]

--test-- "string! -> [string!] 1"
    xs1: ""
    ys1: [""]
    zs1: inits xs1
    --assert* [ys1 == zs1]

--test-- "string! -> [string!] 2"
    xs2: "a"
    ys2: ["" "a"]
    zs2: inits xs2
    --assert* [ys2 == zs2]

--test-- "string! -> [string!] 3"
    xs3: "ab"
    ys3: ["" "a" "ab"]
    zs3: inits xs3
    --assert* [ys3 == zs3]

--test-- "string! -> [string!] 4"
    xs4: "abc"
    ys4: ["" "a" "ab" "abc"]
    zs4: inits xs4
    --assert* [ys4 == zs4]

===end-group===

===start-group=== "tails"

--test-- "[integer!] -> [[integer!] 1"
    xs1: []
    ys1: [[]]
    zs1: tails xs1
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [[integer!] 2"
    xs2: [1]
    ys2: [[1] []]
    zs2: tails xs2
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [[integer!] 3"
    xs3: [1 2]
    ys3: [[1 2] [2] []]
    zs3: tails xs3
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [[integer!] 4"
    xs4: [1 2 3]
    ys4: [[1 2 3] [2 3] [3] []]
    zs4: tails xs4
    --assert* [ys4 == zs4]

--test-- "string! -> [string!]"
    xs1: ""
    xs2: "a"
    xs3: "ab"
    xs4: "abc"
    ys1: [""]
    ys2: ["a" ""]
    ys3: ["ab" "b" ""]
    ys4: ["abc" "bc" "c" ""]
    zs1: tails xs1
    zs2: tails xs2
    zs3: tails xs3
    zs4: tails xs4
    --assert* [ys1 == zs1]
    --assert* [ys2 == zs2]
    --assert* [ys3 == zs3]
    --assert* [ys4 == zs4]

===end-group===

;Predicates
===start-group=== "isPrefixOf"

--test-- "[integer!] -> [integer!] -> logic! 1"
    xs1: []
    ys1: true
    zs1: isPrefixOf xs1 [1 2 3]
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [integer!] -> logic! 2"
    xs2: [1]
    ys2: true
    zs2: isPrefixOf xs2 [1 2 3]
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [integer!] -> logic! 3"
    xs3: [1 2]
    ys3: true
    zs3: isPrefixOf xs3 [1 2 3]
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [integer!] -> logic! 4"
    xs4: [1 2 3]
    ys4: false
    zs4: isPrefixOf xs4 [1 2]
    --assert* [ys4 == zs4]

--test-- "string! -> [string!] 1"
    xs1: ""
    ys1: true 
    zs1: isPrefixOf xs1 "abc"
    --assert* [ys1 == zs1]

--test-- "string! -> [string!] 2"
    xs2: "a"
    ys2: true
    zs2: isPrefixOf xs2 "abc"
    --assert* [ys2 == zs2]

--test-- "string! -> [string!] 3"
    xs3: "ab"
    ys3: true
    zs3: isPrefixOf xs3 "ab"
    --assert* [ys3 == zs3]

--test-- "string! -> [string!] 4"
    xs4: "abc"
    ys4: false
    zs4: isPrefixOf xs4 "ab"
    --assert* [ys4 == zs4]

===end-group===

===start-group=== "isSuffixOf"

--test-- "[integer!] -> [integer!] -> logic! 1"
    xs1: []
    ys1: true
    zs1: isSuffixOf xs1 [1 2 3]
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [integer!] -> logic! 2"
    xs2: [1]
    ys2: false
    zs2: isSuffixOf xs2 [1 2 3]
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [integer!] -> logic! 3"
    xs3: [1 2]
    ys3: false
    zs3: isSuffixOf xs3 [1 2 3]
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [integer!] -> logic! 4"
    xs4: [1 2 3]
    ys4: false
    zs4: isSuffixOf xs4 [1 2]
    --assert* [ys4 == zs4]

--test-- "string! -> [string!] 1"
    xs1: ""
    ys1: true 
    zs1: isSuffixOf xs1 "abc"
    --assert* [ys1 == zs1]

--test-- "string! -> [string!] 2"
    xs2: "a"
    ys2: false
    zs2: isSuffixOf xs2 "abc"
    --assert* [ys2 == zs2]

--test-- "string! -> [string!] 3"
    xs3: "ab"
    ys3: true
    zs3: isSuffixOf xs3 "ab"
    --assert* [ys3 == zs3]

--test-- "string! -> [string!] 4"
    xs4: "abc"
    ys4: false
    zs4: isSuffixOf xs4 "ab"
    --assert* [ys4 == zs4]

===end-group===

===start-group=== "isInfixOf"

--test-- "[integer!] -> [integer!] -> logic! 1"
    xs1: []
    ys1: true
    zs1: isInfixOf xs1 [1 2 3]
    --assert* [ys1 == zs1]

--test-- "[integer!] -> [integer!] -> logic! 2"
    xs2: [1]
    ys2: true
    zs2: isInfixOf xs2 [1 2 3]
    --assert* [ys2 == zs2]

--test-- "[integer!] -> [integer!] -> logic! 3"
    xs3: [1 2]
    ys3: true 
    zs3: isInfixOf xs3 [1 2 3]
    --assert* [ys3 == zs3]

--test-- "[integer!] -> [integer!] -> logic! 4"
    xs4: [1 2 3]
    ys4: false
    zs4: isInfixOf xs4 [1 2 4]
    --assert* [ys4 == zs4]

--test-- "string! -> [string!] 1"
    xs1: ""
    ys1: true 
    zs1: isInfixOf xs1 "abc"
    --assert* [ys1 == zs1]

--test-- "string! -> [string!] 2"
    xs2: "a"
    ys2: true
    zs2: isInfixOf xs2 "abc"
    --assert* [ys2 == zs2]

--test-- "string! -> [string!] 3"
    xs3: "ab"
    ys3: true
    zs3: isInfixOf xs3 "ab"
    --assert* [ys3 == zs3]

--test-- "string! -> [string!] 4"
    xs4: "abc"
    ys4: false
    zs4: isInfixOf xs4 "abd"
    --assert* [ys4 == zs4]

===end-group===

===start-group=== "isSubsequenceOf"

--test-- "[integer!] -> [integer!] -> logic! 1"
    xs: []
    ys: true
    zs: isSubsequenceOf xs [1 2 3]
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] -> logic! 2"
    xs: [1]
    ys: true
    zs: isSubsequenceOf xs [1 2 3]
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] -> logic! 3"
    xs: [1 2 4]
    ys: true 
    zs: isSubsequenceOf xs [1 2 3 4]
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] -> logic! 4"
    xs: [1 2 5]
    ys: true
    zs: isSubsequenceOf xs [1 2 3 4 5]
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] -> logic! 5"
    xs: [1 2 7]
    ys: false
    zs: isSubsequenceOf xs [1 2 3 4 5]
    --assert* [ys == zs]

--test-- "string! -> [string!] -> logic! 1"
    xs: ""
    ys: true 
    zs: isSubsequenceOf xs1 "abc"
    --assert* [ys == zs]

--test-- "string! -> [string!] -> logic! 2"
    xs: "a"
    ys: true
    zs: isSubsequenceOf xs "abc"
    --assert* [ys == zs]

--test-- "string! -> [string!] -> logic! 3"
    xs: "ab"
    ys: true
    zs: isSubsequenceOf xs "a b c"
    --assert* [ys == zs]

--test-- "string! -> [string!] -> logic! 4"
    xs: "abc"
    ys: false
    zs: isSubsequenceOf xs "abd"
    --assert* [ys == zs]

--test-- "string! -> [string!] -> logic! 5"
    xs: "abc f"
    ys: false
    zs: isSubsequenceOf xs "ab cd"
    --assert* [ys == zs]

===end-group===

===start-group=== "elem"

--test-- "integer! -> [integer!] -> logic! 1"
    x: 1
    y: true
    z: elem x [1 2 3]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 2"
    x: 2
    y: true
    z: elem x [1 2 3]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 3"
    x: 3
    y: true 
    z: elem x [1 2 3 4]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 4"
    x: 5
    y: true
    z: elem x [1 2 3 4 5]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 5"
    x: 7
    y: false
    z: elem x [1 2 3 4 5]
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"a"
    y: true 
    z: elem x "abc"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"b"
    y: true
    z: elem x "abc"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"c"
    y: true
    z: elem x "a b c"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"c"
    y: false
    z: elem x "abd"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"e"
    y: false
    z: elem x "ab cd"
    --assert* [y == z]

===end-group===

===start-group=== "notElem"

--test-- "integer! -> [integer!] -> logic! 1"
    x: 1
    y: false
    z: notElem x [1 2 3]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 2"
    x: 2
    y: false
    z: notElem x [1 2 3]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 3"
    x: 3
    y: false
    z: notElem x [1 2 3 4]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 4"
    x: 5
    y: false
    z: notElem x [1 2 3 4 5]
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 5"
    x: 7
    y: true
    z: notElem x [1 2 3 4 5]
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"a"
    y: false
    z: notElem x "abc"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"b"
    y: false
    z: notElem x "abc"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"c"
    y: false
    z: notElem x "a b c"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"c"
    y: true
    z: notElem x "abd"
    --assert* [y == z]

--test-- "string! -> [string!] -> logic! 1"
    x: #"e"
    y: true
    z: notElem x "ab cd"
    --assert* [y == z]

===end-group===

===start-group=== "lookup"

--test-- "word! -> map! -> integer! 1"
    m: #(a: 1 "b" 2 3 3)
    y: 1
    z: lookup 'a m
    --assert* [y == z]

--test-- "string! -> map! -> integer! 2"
    m: #(a: 1 "b" 2 3 3)
    y: 2
    z: lookup "b" m
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 3"
    m: #(a: 1 "b" 2 3 3)
    y: 3
    z: lookup 3 m
    --assert* [y == z]

--test-- "integer! -> [integer!] -> logic! 3"
    m: #(a: 1 "b" 2 3 3)
    y: none
    z: lookup 4 m
    --assert* [y == z]

===end-group===

===start-group=== "find'"

--test-- "integer! -> logic! -> Maybe integer! 1"
    xs: []
    y: none
    z: find' :negative? xs
    --assert* [y == z]

--test-- "integer! -> logic! -> Maybe integer! 2"
    xs: [1 2 3]
    y: none
    z: find' :negative? xs
    --assert* [y == z]

--test-- "integer! -> logic! -> Maybe integer! 3"
    xs: [1 2 3]
    y: 1
    z: find' :positive? xs
    --assert* [y == z]

--test-- "integer! -> logic! -> [integer!] 2"
    xs: [1 2 3]
    y: none
    z: find' :negative? xs
    --assert* [y == z]

--test-- "string! -> logic! -> Maybe integer! 1"
    xs: ""
    y: none
    z: find' :char? xs
    --assert* [y == z]

--test-- "string! -> logic! -> Maybe integer! 2"
    xs: "abc"
    y: none
    z: find' func [x][x == space] xs
    --assert* [y == z]

--test-- "integer! -> logic! -> Maybe integer! 3"
    xs: "abc"
    y:  #"c"
    z:  find' func [x][x == #"c"] xs
    --assert* [y == z]

--test-- "integer! -> logic! -> [integer!] 2"
    xs: "abc"
    y: none
    z: find' func [x][x == space] xs
    --assert* [y == z]
===end-group===

===start-group=== "filter"
--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: []
    zs: filter func [x][x > 10] xs
    --assert* [ys == zs]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 2"
    xs: [1 2 3]
    ys: [2 3]
    zs: filter func [x][x > 1] xs
    --assert* [ys == zs]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 3"
    xs: []
    ys: []
    zs: filter func [x][x > 10] xs
    --assert* [ys == zs]

--test-- "(char! -> logic!) -> string! -> string! 1"
    xs: "abc"
    ys: "bc"
    zs: filter func [x][x > #"a"] xs
    --assert* [ys == zs]

--test-- "(char! -> logic!) -> string! -> string! 2"
    xs: ""
    ys: ""
    zs: filter func [x][x > #"a"] xs
    --assert* [ys == zs]

--test-- "block! -> block!"
    xs: [1 "2" 3 "4" 5 "6"]
    ys1: [1 3 5]
    ys2: ["2" "4" "6"]
    zs1: filter :integer? xs
    zs2: filter :string? xs
    --assert* [ys1 == zs1]
    --assert* [ys2 == zs2]

--test-- "[[integer!]] -> [[integer!]]"
    xs: [[1] [1 2] [1 2 3]]
    ys1: [[1]]
    ys2: [[1 2] [1 2 3]]
    zs1: filter func [x][2 > length? x] xs
    zs2: filter func [x][2 <= length? x] xs
    --assert* [ys1 == zs1]
    --assert* [ys2 == zs2]

===end-group===

===start-group=== "partition"

--test-- "(integer! -> logic!) -> [integer!] -> [[integer]] 1"
    xs: []
    y: [[] []]
    z: partition :negative? xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 2"
    xs: [1 -1 3]
    y: [[-1] [1 3]]
    z: partition :negative? xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> [[integer!]] 3"
    xs: [1 2 3]
    y:  partition :positive? xs
    z:  [[1 2 3] []]
    --assert* [y == z]

--test-- "(string! -> logic!) -> string! -> [string] 1"
    xs: ""
    y: ["" ""]
    z: partition :char? xs
    --assert* [y == z]

--test-- "(string! -> logic!) -> string! -> [string] 2"
    xs: "abc"
    y: ["a" "bc"]
    z: partition func [x][x == #"a"] xs
    --assert* [y == z]

--test-- "(string! -> logic!) -> string! -> [string] 2"
    xs: "abc"
    y: ["abc" ""]
    z: partition func [x][x >= #"a"] xs
    --assert* [y == z]
===end-group===

===start-group=== "!!"

--test-- "[integer!] -> integer! -> integer! 1"
    xs: [1 2 3]
    y: 1
    z: xs !! 0
    --assert* [y == z]

--test-- "[integer!] -> integer! -> integer! 2"
    xs: [1 2 3]
    y: 2
    z: xs !! 1
    --assert* [y == z]

--test-- "[integer!] -> integer! -> integer! 3"
    xs: [1 2 3]
    y: 3
    z: xs !! 2
    --assert* [y == z]

--test-- "[integer!] -> integer! -> integer! 4"
    xs: [1 2 3]
    y: none
    z: xs !! 4
    --assert* [y == z]

--test-- "string! -> integer! -> integer! 1"
    xs: "abc"
    y: #"a"
    z: xs !! 0
    --assert* [y == z]

--test-- "string! -> integer! -> integer! 2"
    xs: "abc"
    y: #"b"
    z: xs !! 1
    --assert* [y == z]

--test-- "string! -> integer! -> integer! 3"
    xs: "abc"
    y: #"c"
    z: xs !! 2
    --assert* [y == z]

--test-- "string! -> integer! -> integer! 4"
    xs: "abc"
    y: none
    z: xs !! 4
    --assert* [y == z]

===end-group===

===start-group=== "elemIndex"

--test-- "integer! -> [integer!] -> Maybe integer! 1"
    xs: [1 2 3]
    y: none
    z: elemIndex 0 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> Maybe integer! 2"
    xs: [1 2 3]
    y: 0
    z: elemIndex 1 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> Maybe integer! 3"
    xs: [1 2 3]
    y: 1
    z: elemIndex 2 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> Maybe integer! 4"
    xs: [1 2 3]
    y: 2
    z: elemIndex 3 xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 1"
    xs: "abc"
    y: none
    z: elemIndex #"f" xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 2"
    xs: "abc"
    y: 0
    z: elemIndex #"a" xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 3"
    xs: "Abc"
    y: none
    z: elemIndex #"a" xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 4"
    xs: "abc"
    y: 1
    z: elemIndex #"b" xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 5"
    xs: "abc"
    y: 2
    z: elemIndex #"c" xs
    --assert* [y == z]

===end-group===

===start-group=== "elemIndices"

--test-- "integer! -> [integer!] -> [integer!] 1"
    xs: [1 2 3 2 1]
    y:  []
    z:  elemIndices 0 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> [integer!] 2"
    xs: [1 2 3 2 1]
    y:  [0 4]
    z:  elemIndices 1 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> [integer!] 3"
    xs: [1 2 3 2 1]
    y: [1 3]
    z: elemIndices 2 xs
    --assert* [y == z]

--test-- "integer! -> [integer!] -> [integer!] 4"
    xs: [1 2 3 2 1]
    y:  [2]
    z:  elemIndices 3 xs
    --assert* [y == z]

--test-- "char! -> string! -> [integer!] 1"
    xs: "abc"
    y: []
    z: elemIndices #"f" xs
    --assert* [y == z]

--test-- "char! -> string! -> [integer!] 2"
    xs: "abcba"
    y: [0 4]
    z: elemIndices #"a" xs
    --assert* [y == z]

--test-- "char! -> string! -> [integer!] 3"
    xs: "abcba"
    y:  [1 3]
    z:  elemIndices #"b" xs
    --assert* [y == z]

--test-- "char! -> string! -> [integer!] 4"
    xs: "abcba"
    y:  [2]
    z:  elemIndices #"c" xs
    --assert* [y == z]

===end-group===

===start-group=== "findIndex"

--test-- "(integer! -> logic!) -> [integer!] -> Maybe integer! 1"
    xs: [1 2 3]
    y: none
    z: findIndex :negative? xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> Maybe integer! 2"
    xs: [1 2 3]
    y: 0
    z: findIndex func [x][x == 1] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> Maybe integer! 3"
    xs: [1 2 3]
    y: 2
    z: findIndex func [x][x > 2] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> Maybe integer! 4"
    xs: [1 2 3]
    y: 0
    z: findIndex :positive? xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 1"
    xs: "abc"
    y: none
    z: findIndex func [x][x == #"f"] xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 2"
    xs: "abc"
    y: 0
    z: findIndex func [x][x == #"a"] xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 3"
    xs: "abc"
    y: 1
    z: findIndex func [x][x == #"b"] xs
    --assert* [y == z]

--test-- "char! -> string! -> Maybe integer! 4"
    xs: "abc"
    y: none
    z: findIndex func [x][x > #"c"] xs
    --assert* [y == z]

===end-group===

===start-group=== "findIndices"

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3 2 1]
    y:  []
    z:  findIndices func [x][x == 7] xs
    --assert* [y == z]

--test-- "(integer! -> logic) -> [integer!] -> [integer!] 2"
    xs: [1 2 3 2 1]
    y:  [0 4]
    z:  findIndices func [x][x == 1] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 3"
    xs: [1 2 3 2 1]
    y: [1 3]
    z: findIndices func [x][(mod x 2) == 0] xs
    --assert* [y == z]

--test-- "(integer! -> logic!) -> [integer!] -> [integer!] 4"
    xs: [1 2 3 2 1]
    y:  [2]
    z:  findIndices func [x][x == 3] xs
    --assert* [y == z]

--test-- "(char! -> logic!) -> string! -> [integer!] 1"
    xs: "abc"
    y: []
    z: findIndices func [x][x == #"f"] xs
    --assert* [y == z]

--test-- "(char! -> logic!) -> string! -> [integer!] 2"
    xs: "abcba"
    y: [0 4]
    z: findIndices func [x][x == #"a"] xs
    --assert* [y == z]

--test-- "(char! -> logic!) -> string! -> [integer!] 3"
    xs: "abcba"
    y:  [1 3]
    z:  findIndices func [x][x == #"b"] xs
    --assert* [y == z]

--test-- "(char! -> string! -> [integer!] 4"
    xs: "abcba"
    y:  [2]
    z:  findIndices func [x][x == #"c"] xs
    --assert* [y == z]

===end-group===

;;Zipping and unzipping lists
===start-group=== "zip"

--test-- "[integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    yss: [[1 4] [2 5] [3 6]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [[integer! | char!]]"
    xs1: [1 2 3]
    xs2: "abc"
    yss: [[1 #"a"] [2 #"b"] [3 #"c"]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    yss: [["a" "b"] ["bc" "de"] ["def" "ghi"]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    yss: [["a" 1] ["bc" 2] ["def" 3]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    yss: [[#"a" #"1"] [#"b" #"2"] [#"c" #"3"]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    yss: [[#"a" #"1"] [#"b" #"2"] [#"c" #"3"]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[[integer!]]]"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    yss: [[[1] [4]] [[2] [5]] [[3] [6]]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    yss: [[[1] [4]] [[2] [5]] [[3] [6]]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    yss: [[["a"] ["d"]] [["b"] ["e"]] [["c"] ["f"]]]
    zss: zip xs1 xs2
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    yss: [[["a"] ["d"]] [["b"] ["e"]] [["c"] ["f"]]]
    zss: zip xs1 xs2
    --assert* [yss == zss]
===end-group===

===start-group=== "zip3"

--test-- "[integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    yss: [[1 4 7] [2 5 8] [3 6 9]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [[integer! | char! | integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    yss: [[1 #"a" 4] [2 #"b" 5] [3 #"c" 6]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "cd" "ghi"]
    xs3: ["c" "de" "jkl"]
    yss: [["a" "b" "c"] ["bc" "cd" "de"] ["def" "ghi" "jkl"]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["d" "e" "f"]
    yss: [["a" 1 "d"] ["bc" 2 "e"] ["def" 3 "f"]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    yss: [[#"a" #"1" #"d"] [#"b" #"2" #"e"] [#"c" #"3" #"f"]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "de"
    yss: [[#"a" #"1" #"d"] [#"b" #"2" #"e"]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[[integer!]]]"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    yss: [[[1] [4] [7]] [[2] [5] [8]] [[3] [6] [9]]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [9]]
    yss: [[[1] [4] [7]] [[2] [5] [9]]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    yss: [[["a"] ["d"] ["g"]] [["b"] ["e"] ["h"]] [["c"] ["f"] ["i"]]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"]]
    yss: [[["a"] ["d"] ["g"]] [["b"] ["e"] ["h"]]]
    zss: zip3 xs1 xs2 xs3
    --assert* [yss == zss]
===end-group===

===start-group=== "zip4"

--test-- "[integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    yss: [[1 4 7 10] [2 5 8 11] [3 6 9 12]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [integer!] -> [string!] -> [[integer! | char! | integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: ["d" "e" "f"]
    yss: [[1 #"a" 4 "d"] [2 #"b" 5 "e"] [3 #"c" 6 "f"]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "cd" "ghi"]
    xs3: ["c" "de" "jkl"]
    xs4: ["d" "ef" "mno"]
    yss: [["a" "b" "c" "d"] ["bc" "cd" "de" "ef"] ["def" "ghi" "jkl" "mno"]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [string!] -> [integer!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["d" "e" "f"]
    xs4: [4 5 6]
    yss: [["a" 1 "d" 4] ["bc" 2 "e" 5] ["def" 3 "f" 6]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    yss: [[#"a" #"1" #"d" #"4"] [#"b" #"2" #"e" #"5"] [#"c" #"3" #"f" #"6"]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "de"
    xs4: "fg"
    yss: [[#"a" #"1" #"d" #"f"] [#"b" #"2" #"e" #"g"]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    yss: [[[1] [4] [7] [10]] [[2] [5] [8] [11]] [[3] [6] [9] [12]]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [9]]
    xs4: [[10] [11]]
    yss: [[[1] [4] [7] [10]] [[2] [5] [9] [11]]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    yss: [[["a"] ["d"] ["g"] ["j"]] [["b"] ["e"] ["h"] ["k"]] [["c"] ["f"] ["i"] ["l"]]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"]]
    xs4: [["i"] ["j"]]
    yss: [[["a"] ["d"] ["g"] ["i"]] [["b"] ["e"] ["h"] ["j"]]]
    zss: zip4 xs1 xs2 xs3 xs4
    --assert* [yss == zss]
===end-group===

===start-group=== "zip5"

--test-- "[integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    yss: [[1 4 7 10 13] [2 5 8 11 14] [3 6 9 12 15]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [integer!] -> [string!] -> [string!] -> [[integer! | char! | integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: ["d" "e" "f"]
    xs5: [7 8 9]
    yss: [[1 #"a" 4 "d" 7] [2 #"b" 5 "e" 8] [3 #"c" 6 "f" 9]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "cd" "ghi"]
    xs3: ["c" "de" "jkl"]
    xs4: ["d" "ef" "mno"]
    xs5: ["e" "gh" "pqr"]
    yss: [["a" "b" "c" "d" "e"] ["bc" "cd" "de" "ef" "gh"] ["def" "ghi" "jkl" "mno" "pqr"]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["d" "e" "f"]
    xs4: [4 5 6]
    xs5: ["g" "h" "i"]
    yss: [["a" 1 "d" 4 "g"] ["bc" 2 "e" 5 "h"] ["def" 3 "f" 6 "i"]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    yss: [[#"a" #"1" #"d" #"4" #"g"] [#"b" #"2" #"e" #"5" #"h"] [#"c" #"3" #"f" #"6" #"i"]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "de"
    xs4: "fg"
    xs5: "hi"
    yss: [[#"a" #"1" #"d" #"f" #"h"] [#"b" #"2" #"e" #"g" #"i"]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    yss: [[[1] [4] [7] [10] [13]] [[2] [5] [8] [11] [14]] [[3] [6] [9] [12] [15]]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [9]]
    xs4: [[10] [11]]
    xs5: [[12] [13]]
    yss: [[[1] [4] [7] [10] [12]] [[2] [5] [9] [11] [13]]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"]] [["b"] ["e"] ["h"] ["k"] ["n"]] [["c"] ["f"] ["i"] ["l"] ["o"]]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"]]
    xs4: [["i"] ["j"]]
    xs5: [["k"] ["l"]]
    yss: [[["a"] ["d"] ["g"] ["i"] ["k"]] [["b"] ["e"] ["h"] ["j"] ["l"]]]
    zss: zip5 xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]
===end-group===

===start-group=== "zip6"

--test-- "[integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    xs6: [16 17 18]
    yss: [[1 4 7 10 13 16] [2 5 8 11 14 17] [3 6 9 12 15 18]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [integer!] -> [string!] -> [integer!] -> [string!] -> [[integer! | char! | integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: ["d" "e" "f"]
    xs5: [7 8 9]
    xs6: ["g" "h" "i"]
    yss: [[1 #"a" 4 "d" 7 "g"] [2 #"b" 5 "e" 8 "h"] [3 #"c" 6 "f" 9 "i"]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "cd" "ghi"]
    xs3: ["c" "de" "jkl"]
    xs4: ["d" "ef" "mno"]
    xs5: ["e" "gh" "pqr"]
    xs6: ["f" "ij" "stu"]
    yss: [["a" "b" "c" "d" "e" "f"] ["bc" "cd" "de" "ef" "gh" "ij"] ["def" "ghi" "jkl" "mno" "pqr" "stu"]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [integer!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["d" "e" "f"]
    xs4: [4 5 6]
    xs5: ["g" "h" "i"]
    xs6: [7 8 9]
    yss: [["a" 1 "d" 4 "g" 7] ["bc" 2 "e" 5 "h" 8] ["def" 3 "f" 6 "i" 9]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "jkl"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"j"] [#"b" #"2" #"e" #"5" #"h" #"k"] [#"c" #"3" #"f" #"6" #"i" #"l"]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "de"
    xs4: "fg"
    xs5: "hi"
    xs6: "jk"
    yss: [[#"a" #"1" #"d" #"f" #"h" #"j"] [#"b" #"2" #"e" #"g" #"i" #"k"]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    yss: [[[1] [4] [7] [10] [13] [16]] [[2] [5] [8] [11] [14] [17]] [[3] [6] [9] [12] [15] [18]]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] -> [[[integer!]]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [9]]
    xs4: [[10] [11]]
    xs5: [[12] [13]]
    xs6: [[14] [15]]
    yss: [[[1] [4] [7] [10] [12] [14]] [[2] [5] [9] [11] [13] [15]]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"]]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"]]
    xs4: [["i"] ["j"]]
    xs5: [["k"] ["l"]]
    xs6: [["m"] ["n"]]
    yss: [[["a"] ["d"] ["g"] ["i"] ["k"] ["m"]] [["b"] ["e"] ["h"] ["j"] ["l"] ["n"]]]
    zss: zip6 xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]
===end-group===

===start-group=== "zip7"

--test-- "[integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    xs6: [16 17 18]
    xs7: [19 20 21]
    yss: [[1 4 7 10 13 16 19] [2 5 8 11 14 17 20] [3 6 9 12 15 18 21]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[integer!] -> string! -> [integer!] -> [string!] -> [integer!] -> [string!] -> [integer!] -> [[integer! char! integer! char! integer! char! integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: ["d" "e" "f"]
    xs5: [7 8 9]
    xs6: ["g" "h" "i"]
    xs7: [11 12 13]
    yss: [[1 #"a" 4 "d" 7 "g" 11] [2 #"b" 5 "e" 8 "h" 12] [3 #"c" 6 "f" 9 "i" 13]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "cd" "ghi"]
    xs3: ["c" "de" "jkl"]
    xs4: ["d" "ef" "mno"]
    xs5: ["e" "gh" "pqr"]
    xs6: ["f" "ij" "stu"]
    xs7: ["g" "hi" "vwx"]
    yss: [["a" "b" "c" "d" "e" "f" "g"] ["bc" "cd" "de" "ef" "gh" "ij" "hi"] ["def" "ghi" "jkl" "mno" "pqr" "stu" "vwx"]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [[string! | integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["d" "e" "f"]
    xs4: [4 5 6]
    xs5: ["g" "h" "i"]
    xs6: [7 8 9]
    xs7: ["j" "k" "l"]
    yss: [["a" 1 "d" 4 "g" 7 "j"] ["bc" 2 "e" 5 "h" 8 "k"] ["def" 3 "f" 6 "i" 9 "l"]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "jkl"
    xs7: "mno"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"j" #"m"] [#"b" #"2" #"e" #"5" #"h" #"k" #"n"] [#"c" #"3" #"f" #"6" #"i" #"l" #"o"]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "string! -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "de"
    xs4: "fg"
    xs5: "hi"
    xs6: "jk"
    xs7: "lm"
    yss: [[#"a" #"1" #"d" #"f" #"h" #"j" #"l"] [#"b" #"2" #"e" #"g" #"i" #"k" #"m"]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] ->[[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    xs7: [[19] [20] [21]]
    yss: [[[1] [4] [7] [10] [13] [16] [19]] [[2] [5] [8] [11] [14] [17] [20]] [[3] [6] [9] [12] [15] [18] [21]]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] ->[[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [9]]
    xs4: [[10] [11]]
    xs5: [[12] [13]]
    xs6: [[14] [15]]
    xs7: [[16] [17]]
    yss: [[[1] [4] [7] [10] [12] [14] [16]] [[2] [5] [9] [11] [13] [15] [17]]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    xs7: [["s"] ["t"] ["u"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"] ["s"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"] ["t"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"] ["u"]]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"]]
    xs4: [["i"] ["j"]]
    xs5: [["k"] ["l"]]
    xs6: [["m"] ["n"]]
    xs7: [["o"] ["p"]]
    yss: [[["a"] ["d"] ["g"] ["i"] ["k"] ["m"] ["o"]] [["b"] ["e"] ["h"] ["j"] ["l"] ["n"] ["p"]]]
    zss: zip7 xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]
===end-group===

===start-group=== "zipWith"

--test-- "(integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [[integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    yss: [[1 4] [2 5] [3 6]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> [integer! | char!]) -> integer!] -> string! -> [[integer! | char!]]"
    xs1: [1 2 3]
    xs2: "abc"
    yss: [[1 #"a"] [2 #"b"] [3 #"c"]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(string! -> string! -> [string!]) -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    yss: [["a" "b"] ["bc" "de"] ["def" "ghi"]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(string! -> integer! -> [string integer!]) -> [string!] -> [integer!] -> [[string! integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    yss: [["a" 1] ["bc" 2] ["def" 3]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(char! -> char! -> [char!]) -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    yss: [[#"a" #"1"] [#"b" #"2"] [#"c" #"3"]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(char! -> char! -> [char!]) -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    yss: [[#"a" #"1"] [#"b" #"2"] [#"c" #"3"]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(char! -> char! -> char!) -> string! -> string! -> string"
    xs1: "abcd"
    xs2: "123"
    yss: "abc"
    zss: zipWith func [x y][x] xs1 xs2
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[[integer!]]]"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    yss: [[[1] [4]] [[2] [5]] [[3] [6]]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    yss: [[[1] [4]] [[2] [5]] [[3] [6]]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> [integer!]) -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    yss: [[["a"] ["d"]] [["b"] ["e"]] [["c"] ["f"]]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> [integer!]) -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    yss: [[["a"] ["d"]] [["b"] ["e"]] [["c"] ["f"]]]
    zss: zipWith func [x y][reduce [x y]] xs1 xs2
    --assert* [yss == zss]

===end-group===

===start-group=== "zipWith3"

--test-- "(integer! -> integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [integer!] -> [[integer! integer! integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    yss: [[1 4 7] [2 5 8] [3 6 9]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> integer! -> [integer! char! integer!]) -> integer!] -> string! -> [[integer! char! integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    yss: [[1 #"a" 4] [2 #"b" 5] [3 #"c" 6]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(string! -> string! -> string! -> [string!]) -> [string!] -> [string!] -> [string] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    xs3: ["c" "fg" "jkl"]
    yss: [["a" "b" "c"] ["bc" "de" "fg"] ["def" "ghi" "jkl"]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(string! -> integer! -> string! -> [string integer! string!]) -> [string!] -> [integer!] -> [string!] -> [[string! integer! string!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["b" "cd" "efg"]
    yss: [["a" 1 "b"] ["bc" 2 "cd"] ["def" 3 "efg"]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> [char!]) -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    yss: [[#"a" #"1" #"d"] [#"b" #"2" #"e"] [#"c" #"3" #"f"]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> [char!]) -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "def"
    yss: [[#"a" #"1" #"d"] [#"b" #"2" #"e"] [#"c" #"3" #"f"]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char!) -> string! -> string! -> string! -> string!"
    xs1: "abcd"
    xs2: "123"
    xs3: "def"
    yss: "abc"
    zss: zipWith3 func [x y z][x] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [string!] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    yss: [[[1] [4] [7]] [[2] [5] [8]] [[3] [6] [9]]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [8] [9]]
    yss: [[[1] [4] [7]] [[2] [5] [8]] [[3] [6] [9]]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    yss: [[["a"] ["d"] ["g"]] [["b"] ["e"] ["h"]] [["c"] ["f"] ["i"]]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    yss: [[["a"] ["d"] ["g"]] [["b"] ["e"] ["h"]] [["c"] ["f"] ["i"]]]
    zss: zipWith3 func [x y z][reduce [x y z]] xs1 xs2 xs3
    --assert* [yss == zss]

===end-group===

===start-group=== "zipWith4"

--test-- "(integer! -> integer! -> integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer! integer! integer! integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    yss: [[1 4 7 10] [2 5 8 11] [3 6 9 12]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> integer! -> char! -> [integer! char!]) -> integer!] -> string! -> [[integer! char! integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: "def"
    yss: [[1 #"a" 4 #"d"] [2 #"b" 5 #"e"] [3 #"c" 6 #"f"]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(string! -> string! -> string! -> string! -> [string!]) -> [string!] -> [string!] -> [string] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    xs3: ["c" "fg" "jkl"]
    xs4: ["d" "hi" "mno"]
    yss: [["a" "b" "c" "d"] ["bc" "de" "fg" "hi"] ["def" "ghi" "jkl" "mno"]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(string! -> integer! -> string! -> integer! -> [string integer! string! integer!]) -> [string!] -> [integer!] -> [string!] -> [integer!] -> [[string! integer! string! integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["b" "cd" "efg"]
    xs4: [4 5 6]
    yss: [["a" 1 "b" 4] ["bc" 2 "cd" 5] ["def" 3 "efg" 6]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> [char!]) -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    yss: [[#"a" #"1" #"d" #"4"] [#"b" #"2" #"e" #"5"] [#"c" #"3" #"f" #"6"]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> [char!]) -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    yss: [[#"a" #"1" #"d" #"4"] [#"b" #"2" #"e" #"5"] [#"c" #"3" #"f" #"6"]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char! -> char!) -> string! -> string! -> string! -> string! -> string!"
    xs1: "abcd"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    yss: "abc"
    zss: zipWith4 func [x y z u][x] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    yss: [[[1] [4] [7] [10]] [[2] [5] [8] [11]] [[3] [6] [9] [12]]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    yss: [[[1] [4] [7] [10]] [[2] [5] [8] [11]] [[3] [6] [9] [12]]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    yss: [[["a"] ["d"] ["g"] ["j"]] [["b"] ["e"] ["h"] ["k"]] [["c"] ["f"] ["i"] ["l"]]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    yss: [[["a"] ["d"] ["g"] ["j"]] [["b"] ["e"] ["h"] ["k"]] [["c"] ["f"] ["i"] ["l"]]]
    zss: zipWith4 func [x y z u][reduce [x y z u]] xs1 xs2 xs3 xs4
    --assert* [yss == zss]

===end-group===

===start-group=== "zipWith5"

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer! integer! integer! integer! integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    yss: [[1 4 7 10 13] [2 5 8 11 14] [3 6 9 12 15]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> integer! -> char! -> [integer! char!]) -> integer!] -> string! -> [[integer! char! integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: "def"
    xs5: [7 8 9]
    yss: [[1 #"a" 4 #"d" 7] [2 #"b" 5 #"e" 8] [3 #"c" 6 #"f" 9]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(string! -> string! -> string! -> string! -> [string!]) -> [string!] -> [string!] -> [string] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    xs3: ["c" "fg" "jkl"]
    xs4: ["d" "hi" "mno"]
    xs5: ["e" "jk" "pqr"]
    yss: [["a" "b" "c" "d" "e"] ["bc" "de" "fg" "hi" "jk"] ["def" "ghi" "jkl" "mno" "pqr"]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(string! -> integer! -> string! -> integer! -> string! -> [string integer! string! integer! string]) -> [string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [[string! integer! string! integer! string!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["b" "cd" "efg"]
    xs4: [4 5 6]
    xs5: ["c" "ef" "hij"]
    yss: [["a" 1 "b" 4 "c"] ["bc" 2 "cd" 5 "ef"] ["def" 3 "efg" 6 "hij"]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> char -> [char!]) -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    yss: [[#"a" #"1" #"d" #"4" #"g"] [#"b" #"2" #"e" #"5" #"h"] [#"c" #"3" #"f" #"6" #"i"]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> [char!]) -> string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    yss: [[#"a" #"1" #"d" #"4" #"g"] [#"b" #"2" #"e" #"5" #"h"] [#"c" #"3" #"f" #"6" #"i"]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char! -> char! -> char!) -> string! -> string! -> string! -> string! -> string! -> string!"
    xs1: "abcd"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    yss: "abc"
    zss: zipWith5 func [x y z u v][x] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    yss: [[[1] [4] [7] [10] [13]] [[2] [5] [8] [11] [14]] [[3] [6] [9] [12] [15]]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    yss: [[[1] [4] [7] [10] [13]] [[2] [5] [8] [11] [14]] [[3] [6] [9] [12] [15]]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] ->  [[string!]] -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"]] [["b"] ["e"] ["h"] ["k"] ["n"]] [["c"] ["f"] ["i"] ["l"] ["o"]]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] ->  [[string!]] -> [[string!]] -> [[string!]] -> [[string!]]-> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"]] [["b"] ["e"] ["h"] ["k"] ["n"]] [["c"] ["f"] ["i"] ["l"] ["o"]]]
    zss: zipWith5 func [x y z u v][reduce [x y z u v]] xs1 xs2 xs3 xs4 xs5
    --assert* [yss == zss]

===end-group===

===start-group=== "zipWith6"

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer! integer! integer! integer! integer! integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    xs6: [16 17 18]
    yss: [[1 4 7 10 13 16] [2 5 8 11 14 17] [3 6 9 12 15 18]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> integer! -> char! -> integer! -> [integer! char! integer! char! integer! char!]) -> integer!] -> string! -> [[integer! char! integer! char! integer! char!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: "def"
    xs5: [7 8 9]
    xs6: "ghi"
    yss: [[1 #"a" 4 #"d" 7 #"g"] [2 #"b" 5 #"e" 8 #"h"] [3 #"c" 6 #"f" 9 #"i"]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(string! -> string! -> string! -> string! -> string! -> [string!]) -> [string!] -> [string!] -> [string!] -> [string] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    xs3: ["c" "fg" "jkl"]
    xs4: ["d" "hi" "mno"]
    xs5: ["e" "jk" "pqr"]
    xs6: ["f" "lm" "stu"]
    yss: [["a" "b" "c" "d" "e" "f"] ["bc" "de" "fg" "hi" "jk" "lm"] ["def" "ghi" "jkl" "mno" "pqr" "stu"]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(string! -> integer! -> string! -> integer! -> string! -> [string integer! string! integer! string]) -> [string!] -> [integer!] -> [string!] -> [integer!] -> [[string! integer! string! integer! string! integer!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["b" "cd" "efg"]
    xs4: [4 5 6]
    xs5: ["c" "ef" "hij"]
    xs6: [7 8 9]
    yss: [["a" 1 "b" 4 "c" 7] ["bc" 2 "cd" 5 "ef" 8] ["def" 3 "efg" 6 "hij" 9]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> char -> char -> [char!]) -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"7"] [#"b" #"2" #"e" #"5" #"h" #"8"] [#"c" #"3" #"f" #"6" #"i" #"9"]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> char -> char -> [char!]) -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"7"] [#"b" #"2" #"e" #"5" #"h" #"8"] [#"c" #"3" #"f" #"6" #"i" #"9"]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char! -> char! -> char! -> char!) -> string! -> string! -> string! -> string! -> string! -> string! -> string!"
    xs1: "abcd"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    yss: "abc"
    zss: zipWith6 func [x y z u v w][x] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    yss: [[[1] [4] [7] [10] [13] [16]] [[2] [5] [8] [11] [14] [17]] [[3] [6] [9] [12] [15] [18]]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    yss: [[[1] [4] [7] [10] [13] [16]] [[2] [5] [8] [11] [14] [17]] [[3] [6] [9] [12] [15] [18]]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"]]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"]]]
    zss: zipWith6 func [x y z u v w][reduce [x y z u v w]] xs1 xs2 xs3 xs4 xs5 xs6
    --assert* [yss == zss]

===end-group===

===start-group=== "zipWith7"

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [integer!] -> [[integer! integer! integer! integer! integer! integer! integer!]]"
    xs1: [1 2 3]
    xs2: [4 5 6]
    xs3: [7 8 9]
    xs4: [10 11 12]
    xs5: [13 14 15]
    xs6: [16 17 18]
    xs7: [19 20 21]
    yss: [[1 4 7 10 13 16 19] [2 5 8 11 14 17 20] [3 6 9 12 15 18 21]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "[(integer! -> char! -> integer! -> char! -> integer! -> char! -> integer! -> [integer! char! integer! char! integer! char! integer!]) -> [integer!] -> string! -> [integer!] -> string! -> [integer!] -> string! -> [integer!] -> [[integer! char! integer! char! integer! char! integer!]]"
    xs1: [1 2 3]
    xs2: "abc"
    xs3: [4 5 6]
    xs4: "def"
    xs5: [7 8 9]
    xs6: "ghi"
    xs7: [10 11 12]
    yss: [[1 #"a" 4 #"d" 7 #"g" 10] [2 #"b" 5 #"e" 8 #"h" 11] [3 #"c" 6 #"f" 9 #"i" 12]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(string! -> string! -> string! -> string! -> string! -> string! -> string! -> [string!]) -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string] -> [string!] -> [string!] -> [string!] -> [[string!]]"
    xs1: ["a" "bc" "def"]
    xs2: ["b" "de" "ghi"]
    xs3: ["c" "fg" "jkl"]
    xs4: ["d" "hi" "mno"]
    xs5: ["e" "jk" "pqr"]
    xs6: ["f" "lm" "stu"]
    xs7: ["g" "op" "vwx"]
    yss: [["a" "b" "c" "d" "e" "f" "g"] ["bc" "de" "fg" "hi" "jk" "lm" "op"] ["def" "ghi" "jkl" "mno" "pqr" "stu" "vwx"]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(string! -> integer! -> string! -> integer! -> string! -> integer! -> string! -> [string integer! string! integer! string integer! string]) -> [string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [integer!] -> [string!] -> [[string! integer! string! integer! string! integer! string!]]"
    xs1: ["a" "bc" "def"]
    xs2: [1 2 3]
    xs3: ["b" "cd" "efg"]
    xs4: [4 5 6]
    xs5: ["c" "ef" "hij"]
    xs6: [7 8 9]
    xs7: ["d" "gh" "klm"]
    yss: [["a" 1 "b" 4 "c" 7 "d"] ["bc" 2 "cd" 5 "ef" 8 "gh"] ["def" 3 "efg" 6 "hij" 9 "klm"]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> char -> char -> char! -> [char!]) -> string! -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 1"
    xs1: "abc"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    xs7: "jkl"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"7" #"j"] [#"b" #"2" #"e" #"5" #"h" #"8" #"k"] [#"c" #"3" #"f" #"6" #"i" #"9" #"l"]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char -> char -> char -> char! -> [char!]) -> string! -> string! -> string! -> string! -> string! -> string! -> string! -> [[char!]] 2"
    xs1: "abcb"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    xs7: "jkl"
    yss: [[#"a" #"1" #"d" #"4" #"g" #"7" #"j"] [#"b" #"2" #"e" #"5" #"h" #"8" #"k"] [#"c" #"3" #"f" #"6" #"i" #"9" #"l"]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(char! -> char! -> char! -> char! -> char! -> char! -> char! -> char!) -> string! -> string! -> string! -> string! -> string! -> string! -> string! -> string!"
    xs1: "abcd"
    xs2: "123"
    xs3: "def"
    xs4: "456"
    xs5: "ghi"
    xs6: "789"
    xs7: "jkl"
    yss: "abc"
    zss: zipWith7 func [x y z u v w t][x] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 1"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    xs7: [[19] [20] [21]]
    yss: [[[1] [4] [7] [10] [13] [16] [19]] [[2] [5] [8] [11] [14] [17] [20]] [[3] [6] [9] [12] [15] [18] [21]]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "(integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> integer! -> [integer!]) -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[integer!]] -> [[[integer!]]] 2"
    xs1: [[1] [2] [3]]
    xs2: [[4] [5] [6] [7]]
    xs3: [[7] [8] [9]]
    xs4: [[10] [11] [12]]
    xs5: [[13] [14] [15]]
    xs6: [[16] [17] [18]]
    xs7: [[19] [20] [21]]
    yss: [[[1] [4] [7] [10] [13] [16] [19]] [[2] [5] [8] [11] [14] [17] [20]] [[3] [6] [9] [12] [15] [18] [21]]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 1"
    xs1: [["a"] ["b"] ["c"]]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    xs7: [["s"] ["t"] ["u"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"] ["s"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"] ["t"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"] ["u"]]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

--test-- "([string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!] -> [string!]) -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[string!]] -> [[[string!]]] 2"
    xs1: [["a"] ["b"] ["c"] "e"]
    xs2: [["d"] ["e"] ["f"]]
    xs3: [["g"] ["h"] ["i"]]
    xs4: [["j"] ["k"] ["l"]]
    xs5: [["m"] ["n"] ["o"]]
    xs6: [["p"] ["q"] ["r"]]
    xs7: [["s"] ["t"] ["u"]]
    yss: [[["a"] ["d"] ["g"] ["j"] ["m"] ["p"] ["s"]] [["b"] ["e"] ["h"] ["k"] ["n"] ["q"] ["t"]] [["c"] ["f"] ["i"] ["l"] ["o"] ["r"] ["u"]]]
    zss: zipWith7 func [x y z u v w t][reduce [x y z u v w t]] xs1 xs2 xs3 xs4 xs5 xs6 xs7
    --assert* [yss == zss]

===end-group===

===start-group=== "unzip"

--test-- "[[integer!]] -> [[integer!] [integer!]]"
    xss: [[1 4] [2 5] [3 6]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    yss: reduce [ys1 ys2]
    zss: unzip xss
    --assert* [yss == zss]

--test-- "[[integer! char!]] -> [[integer!] [char!]]"
    xss: [[1 #"a"] [2 #"b"] [3 #"c"]]
    ys1: [1 2 3]
    ys2: "abc"
    yss: reduce [ys1 ys2]
    zss: unzip xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!]]"
    xss: [["a" "b"] ["bc" "de"] ["def" "ghi"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "de" "ghi"]
    yss: reduce [ys1 ys2] 
    zss: unzip xss
    --assert* [yss == zss]

--test-- "[string! integer!] -> [[string!] [integer!]]"
    xss: [["a" 1] ["bc" 2] ["def" 3]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    yss: reduce [ys1 ys2]
    zss: unzip xss
    --assert* [yss == zss]

--test-- "[char! char!] -> [string!]]"
    xss: [[#"a" #"1"] [#"b" #"2"] [#"c" #"3"]]
    ys1: "abc"
    ys2: "123"
    yss: reduce [ys1 ys2]
    zss: unzip xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!]]"
    xss: [[[1] [4]] [[2] [5]] [[3] [6]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    yss: reduce [ys1 ys2]
    zss: unzip xss
    --assert* [yss == zss]
===end-group===

===start-group=== "unzip3"

--test-- "[[integer!]] -> [[integer!] [integer!] [integer!]]"
    xss: [[1 4 7] [2 5 8] [3 6 9]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    ys3: [7 8 9]
    yss: reduce [ys1 ys2 ys3]
    zss: unzip3 xss
    --assert* [yss == zss]

--test-- "[[integer! char! integer!]] -> [[integer!] [char!] [integer!]]"
    xss: [[1 #"a" 4] [2 #"b" 5] [3 #"c" 6]]
    ys1: [1 2 3]
    ys2: "abc"
    ys3: [4 5 6]
    yss: reduce [ys1 ys2 ys3]
    zss: unzip3 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!] [string!]]"
    xss: [["a" "b" "c"] ["bc" "cd" "de"] ["def" "ghi" "jkl"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "cd" "ghi"]
    ys3: ["c" "de" "jkl"]
    yss: reduce [ys1 ys2 ys3] 
    zss: unzip3 xss
    --assert* [yss == zss]

--test-- "[[string! integer! string!]] -> [[string!] [integer!] [string!]]"
    xss: [["a" 1 "d"] ["bc" 2 "e"] ["def" 3 "f"]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    ys3: ["d" "e" "f"]
    yss: reduce [ys1 ys2 ys3]
    zss: unzip3 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[char!] [char!] [char!]]"
    xss: [[#"a" #"1" #"d"] [#"b" #"2" #"e"] [#"c" #"3" #"f"]]
    ys1: "abc"
    ys2: "123"
    ys3: "def"
    yss: reduce [ys1 ys2 ys3]
    zss: unzip3 xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!] [integer!]]"
    xss: [[[1] [4] [7]] [[2] [5] [8]] [[3] [6] [9]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    ys3: [[7] [8] [9]]
    yss: reduce [ys1 ys2 ys3]
    zss: unzip3 xss
    --assert* [yss == zss]
===end-group===

===start-group=== "unzip4"

--test-- "[[integer!]] -> [[integer!] [integer!] [integer!] [integer!]]"
    xss: [[1 4 7 10] [2 5 8 11] [3 6 9 12]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    ys3: [7 8 9]
    ys4: [10 11 12]
    yss: reduce [ys1 ys2 ys3 ys4]
    zss: unzip4 xss
    --assert* [yss == zss]

--test-- "[[integer! char! integer! char!]] -> [[integer!] [char!] [integer!] [char!]]"
    xss: [[1 #"a" 4 "d"] [2 #"b" 5 "e"] [3 #"c" 6 "f"]]
    ys1: [1 2 3]
    ys2: "abc"
    ys3: [4 5 6]
    ys4: ["d" "e" "f"]
    yss: reduce [ys1 ys2 ys3 ys4]
    zss: unzip4 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!] [string!] [string!]]"
    xss: [["a" "b" "c" "d"] ["bc" "cd" "de" "ef"] ["def" "ghi" "jkl" "mno"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "cd" "ghi"]
    ys3: ["c" "de" "jkl"]
    ys4: ["d" "ef" "mno"]
    yss: reduce [ys1 ys2 ys3 ys4] 
    zss: unzip4 xss
    --assert* [yss == zss]

--test-- "[[string! integer! string! integer!]] -> [[string!] [integer!] [string!] [integer!]]"
    xss: [["a" 1 "d" 4] ["bc" 2 "e" 5] ["def" 3 "f" 6]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    ys3: ["d" "e" "f"]
    ys4: [4 5 6]
    yss: reduce [ys1 ys2 ys3 ys4]
    zss: unzip4 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[char!] [char!] [char!] [char!]]"
    xss: [[#"a" #"1" #"d" #"4"] [#"b" #"2" #"e" #"5"] [#"c" #"3" #"f" #"6"]]
    ys1: "abc"
    ys2: "123"
    ys3: "def"
    ys4: "456"
    yss: reduce [ys1 ys2 ys3 ys4]
    zss: unzip4 xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!] [integer!] [integer!]]"
    xss: [[[1] [4] [7] [10]] [[2] [5] [8] [11]] [[3] [6] [9] [12]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    ys3: [[7] [8] [9]]
    ys4: [[10] [11] [12]]
    yss: reduce [ys1 ys2 ys3 ys4]
    zss: unzip4 xss
    --assert* [yss == zss]
===end-group===

===start-group=== "unzip5"

--test-- "[[integer!]] -> [[integer!] [integer!] [integer!] [integer!] [integer!]]"
    xss: [[1 4 7 10 13] [2 5 8 11 14] [3 6 9 12 15]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    ys3: [7 8 9]
    ys4: [10 11 12]
    ys5: [13 14 15]
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]

--test-- "[[integer! char! integer! char! integer!]] -> [[integer!] [char!] [integer!] [char!] [integer!]]"
    xss: [[1 #"a" 4 "d" 7] [2 #"b" 5 "e" 8] [3 #"c" 6 "f" 9]]
    ys1: [1 2 3]
    ys2: "abc"
    ys3: [4 5 6]
    ys4: ["d" "e" "f"]
    ys5: [7 8 9]
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!] [string!] [string!] [string!]]"
    xss: [["a" "b" "c" "d" "e"] ["bc" "cd" "de" "ef" "gh"] ["def" "ghi" "jkl" "mno" "pqr"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "cd" "ghi"]
    ys3: ["c" "de" "jkl"]
    ys4: ["d" "ef" "mno"]
    ys5: ["e" "gh" "pqr"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]

--test-- "[[string! integer! string! integer! string!]] -> [[string!] [integer!] [string!] [integer!] [string!]]"
    xss: [["a" 1 "d" 4 "g"] ["bc" 2 "e" 5 "h"] ["def" 3 "f" 6 "i"]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    ys3: ["d" "e" "f"]
    ys4: [4 5 6]
    ys5: ["g" "h" "i"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[char!] [char!] [char!] [char!] [char!]]"
    xss: [[#"a" #"1" #"d" #"4" #"g"] [#"b" #"2" #"e" #"5" #"h"] [#"c" #"3" #"f" #"6" #"i"]]
    ys1: "abc"
    ys2: "123"
    ys3: "def"
    ys4: "456"
    ys5: "ghi"
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!] [integer!] [integer!] [integer!]]"
    xss: [[[1] [4] [7] [10] [13]] [[2] [5] [8] [11] [14]] [[3] [6] [9] [12] [15]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    ys3: [[7] [8] [9]]
    ys4: [[10] [11] [12]]
    ys5: [[13] [14] [15]]
    yss: reduce [ys1 ys2 ys3 ys4 ys5]
    zss: unzip5 xss
    --assert* [yss == zss]
===end-group===

===start-group=== "unzip6"

--test-- "[[integer!]] -> [[integer!] [integer!] [integer!] [integer!] [integer!] [integer!]]"
    xss: [[1 4 7 10 13 16] [2 5 8 11 14 17] [3 6 9 12 15 18]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    ys3: [7 8 9]
    ys4: [10 11 12]
    ys5: [13 14 15]
    ys6: [16 17 18]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]

--test-- "[[integer! char! integer! char! integer! char!]] -> [[integer!] [char!] [integer!] [char!] [interger!] [char!]]"
    xss: [[1 #"a" 4 "d" 7 "g"] [2 #"b" 5 "e" 8 "h"] [3 #"c" 6 "f" 9 "i"]]
    ys1: [1 2 3]
    ys2: "abc"
    ys3: [4 5 6]
    ys4: ["d" "e" "f"]
    ys5: [7 8 9]
    ys6: ["g" "h" "i"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!] [string!] [string!] [string!] [string!]]"
    xss: [["a" "b" "c" "d" "e" "f"] ["bc" "cd" "de" "ef" "gh" "ij"] ["def" "ghi" "jkl" "mno" "pqr" "stu"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "cd" "ghi"]
    ys3: ["c" "de" "jkl"]
    ys4: ["d" "ef" "mno"]
    ys5: ["e" "gh" "pqr"]
    ys6: ["f" "ij" "stu"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]

--test-- "[[string! integer! string! integer! string! integer!]] -> [[string!] [integer!] [string!] [integer! string! integer!]]"
    xss: [["a" 1 "d" 4 "g" 7] ["bc" 2 "e" 5 "h" 8] ["def" 3 "f" 6 "i" 9]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    ys3: ["d" "e" "f"]
    ys4: [4 5 6]
    ys5: ["g" "h" "i"]
    ys6: [7 8 9]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[char!] [char!] [char!] [char!] [char!] [char!]]"
    xss: [[#"a" #"1" #"d" #"4" #"g" #"j"] [#"b" #"2" #"e" #"5" #"h" #"k"] [#"c" #"3" #"f" #"6" #"i" #"l"]]
    ys1: "abc"
    ys2: "123"
    ys3: "def"
    ys4: "456"
    ys5: "ghi"
    ys6: "jkl"
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!] [integer!] [integer!] [string!] [string!]]"
    xss: [[[1] [4] [7] [10] [13] [16]] [[2] [5] [8] [11] [14] [17]] [[3] [6] [9] [12] [15] [18]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    ys3: [[7] [8] [9]]
    ys4: [[10] [11] [12]]
    ys5: [[13] [14] [15]]
    ys6: [[16] [17] [18]]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6]
    zss: unzip6 xss
    --assert* [yss == zss]
===end-group===

===start-group=== "unzip7"

--test-- "[[integer!]] -> [[integer!] [integer!] [integer!] [integer!] [integer!] [integer!] [integer!]]"
    xss: [[1 4 7 10 13 16 19] [2 5 8 11 14 17 20] [3 6 9 12 15 18 21]]
    ys1: [1 2 3]
    ys2: [4 5 6]
    ys3: [7 8 9]
    ys4: [10 11 12]
    ys5: [13 14 15]
    ys6: [16 17 18]
    ys7: [19 20 21]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]

--test-- "[[integer! char! integer! char! integer! char!]] -> [[integer!] [char!] [integer!] [char!] [interger!] [char!] [interger!]]"
    xss: [[1 #"a" 4 "d" 7 "g" 11] [2 #"b" 5 "e" 8 "h" 12] [3 #"c" 6 "f" 9 "i" 13]]
    ys1: [1 2 3]
    ys2: "abc"
    ys3: [4 5 6]
    ys4: ["d" "e" "f"]
    ys5: [7 8 9]
    ys6: ["g" "h" "i"]
    ys7: [11 12 13]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[string!] [string!] [string!] [string!] [string!] [string!] [string!]]"
    xss: [["a" "b" "c" "d" "e" "f" "g"] ["bc" "cd" "de" "ef" "gh" "ij" "hi"] ["def" "ghi" "jkl" "mno" "pqr" "stu" "vwx"]]
    ys1: ["a" "bc" "def"]
    ys2: ["b" "cd" "ghi"]
    ys3: ["c" "de" "jkl"]
    ys4: ["d" "ef" "mno"]
    ys5: ["e" "gh" "pqr"]
    ys6: ["f" "ij" "stu"]
    ys7: ["g" "hi" "vwx"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]

--test-- "[[string! integer! string! integer! string! integer! string!]] -> [[string!] [integer!] [string!] [integer! string! integer!] [string!]]"
    xss: [["a" 1 "d" 4 "g" 7 "j"] ["bc" 2 "e" 5 "h" 8 "k"] ["def" 3 "f" 6 "i" 9 "l"]]
    ys1: ["a" "bc" "def"]
    ys2: [1 2 3]
    ys3: ["d" "e" "f"]
    ys4: [4 5 6]
    ys5: ["g" "h" "i"]
    ys6: [7 8 9]
    ys7: ["j" "k" "l"]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]

--test-- "[[string!]] -> [[char!] [char!] [char!] [char!] [char!] [char!] [char!]]"
    xss: [[#"a" #"1" #"d" #"4" #"g" #"j" #"m"] [#"b" #"2" #"e" #"5" #"h" #"k" #"n"] [#"c" #"3" #"f" #"6" #"i" #"l" #"o"]]
    ys1: "abc"
    ys2: "123"
    ys3: "def"
    ys4: "456"
    ys5: "ghi"
    ys6: "jkl"
    ys7: "mno"
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]

--test-- "[[[integer!]]] -> [[integer!] [integer!] [integer!] [integer!] [string!] [string!] [string!]]"
    xss: [[[1] [4] [7] [10] [13] [16] [19]] [[2] [5] [8] [11] [14] [17] [20]] [[3] [6] [9] [12] [15] [18] [21]]]
    ys1: [[1] [2] [3]]
    ys2: [[4] [5] [6]]
    ys3: [[7] [8] [9]]
    ys4: [[10] [11] [12]]
    ys5: [[13] [14] [15]]
    ys6: [[16] [17] [18]]
    ys7: [[19] [20] [21]]
    yss: reduce [ys1 ys2 ys3 ys4 ys5 ys6 ys7]
    zss: unzip7 xss
    --assert* [yss == zss]
===end-group===

;;Special lists
;;Functions on strings

===start-group=== "lines"

--test-- "string! -> [string!] 1"
    xs:  "abc^(line)def^(line)"
    yss: ["abc" "def"]
    zss: lines xs
    --assert* [yss == zss]

--test-- "string! -> [string!] 2"
    xs:  "abc^(line)def^(line)^(line)"
    yss: ["abc" "def" ""]
    zss: lines xs
    --assert* [yss == zss]

--test-- "string! -> [string!] 3"
    xs:  "abc"
    yss: ["abc"]
    zss: lines xs
    --assert* [yss == zss]

===end-group===

===start-group=== "words"

--test-- "string! -> [string!] 1"
    xs:  "abcdef"
    yss: ["abcdef"]
    zss: words xs
    --assert* [yss == zss]

--test-- "string! -> [string!] 2"
    xs:  "abc def"
    yss: ["abc" "def"]
    zss: words xs
    --assert* [yss == zss]

--test-- "string! -> [string!] 3"
    xs:  "abc def  "
    yss: ["abc" "def"]
    zss: words xs
    --assert* [yss == zss]

===end-group===

===start-group=== "unlines"
--test-- "[string!] -> string! 1"
    xss: ["abc" "def"]
    ys:  "abc^(line)def^(line)"
    zs:  unlines xss
    --assert* [ys == zs]

--test-- "[string!] -> string! 2"
    xss: ["abc" "def" ""]
    ys:  "abc^(line)def^(line)^(line)"
    zs:  unlines xss
    --assert* [ys == zs]

--test-- "[string!] -> string! 3"
    xss: ["abc" "def" #"a"]
    ys:  none
    zs:  unlines xss
    --assert* [ys == zs]

===end-group===

===start-group=== "unwords"
--test-- "[string!] -> string! 1"
    xss: ["abc" "def"]
    ys:  "abc def"
    zs:  unwords xss
    --assert* [ys == zs]

--test-- "[string!] -> string! 2"
    xss: ["abc" "def" ""]
    ys:  "abc def "
    zs:  unwords xss
    --assert* [ys == zs]

--test-- "[string!] -> string! 3"
    xss: ["abc" "def" #"a"]
    ys:  none
    zs:  unwords xss
    --assert* [ys == zs]

===end-group===

;;"Set" operations
===start-group=== "nub"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def"]
    zss: nub xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "def"]
    zss: nub xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["abc" "def"]
    zss: nub xss
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abcabc"
    ys: "abc"
    zs: nub xs
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: "abcABC"
    zs: nub xs
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  "a bcd"
    zs: nub xs
    --assert* [ys == zs]

===end-group===

===start-group=== "delete'"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def"]
    zss: delete' "abcd" xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "def"]
    zss: delete' "def" xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["def" "abc"]
    zss: delete' "abc" xss
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "ac"
    zs: delete' #"b" xs
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: "abcBC"
    zs: delete' #"A" xs
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  "ab c d"
    zs:  delete' space xs
    --assert* [ys == zs]

===end-group===

===start-group=== "union'"

--test-- "[string!] -> [string!] -> [string!] 1"
    xss1: ["abc" "def"]
    xss2: ["abc" "ghi"]
    yss:  ["abc" "def" "ghi"]
    zss:  union' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 2"
    xss1: ["abc" "def" "def"]
    xss2: ["abc" "def"]
    yss:  ["abc" "def" "def"]
    zss:  union' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 3"
    xss1: ["abc" "def" "def"]
    xss2: []
    yss:  ["abc" "def" "def"]
    zss:  union' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 4"
    xss1: []
    xss2: ["abc" "def" "def"]
    yss:  ["abc" "def" "def"]
    zss:  union' xss1 xss2
    --assert* [yss == zss]

--test-- "string! -> string! -> string! 1"
    xs1: "abc"
    xs2: "def"
    ys: "abcdef"
    zs:  union' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> string! -> string! 2"
    xs1: "abcABC"
    xs2: "" 
    ys:  "abcABC"
    zs: union' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> string! -> string! 2"
    xs1: "" 
    xs2: "abcABC"
    ys:  "abcABC"
    zs: union' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> [integer!] -> string!"
    xs1: "abc"
    xs2: [1 2 3]
    ys:  none
    zs:  union' xs1 xs2
    --assert* [ys == zs]

--test-- "[integer!] -> string! -> string!"
    xs1: [1 2 3]
    xs2: "abc"
    ys:  none
    zs:  union' xs1 xs2
    --assert* [ys == zs]

--test-- "[string!] -> [integer!] -> [string | string!]"
    xs1: ["abc" "def" "def"]
    xs2: [1 2 3]
    ys:  ["abc" "def" "def" 1 2 3]
    zs:  union' xs1 xs2
    --assert* [ys == zs]

===end-group===

===start-group=== "intersect'"

--test-- "[string!] -> [string!] -> [string!] 1"
    xss1: ["abc" "def"]
    xss2: ["abc" "ghi"]
    yss:  ["abc"]
    zss:  intersect' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 2"
    xss1: ["abc" "def" "def"]
    xss2: ["abc" "def"]
    yss:  ["abc" "def"]
    zss:  intersect' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 3"
    xss1: ["abc" "def" "def"]
    xss2: []
    yss:  []
    zss:  intersect' xss1 xss2
    --assert* [yss == zss]

--test-- "[string!] -> [string!] -> [string!] 4"
    xss1: []
    xss2: ["abc" "def" "def"]
    yss:  []
    zss:  intersect' xss1 xss2
    --assert* [yss == zss]

--test-- "string! -> string! -> string! 1"
    xs1: "abc"
    xs2: "def"
    ys:  ""
    zs:  intersect' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> string! -> string! 2"
    xs1: "abcABC"
    xs2: "" 
    ys:  ""
    zs: intersect' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> string! -> string! 2"
    xs1: "" 
    xs2: "abcABC"
    ys:  ""
    zs:  intersect' xs1 xs2
    --assert* [ys == zs]

--test-- "string! -> [integer!] -> string!"
    xs1: "abc"
    xs2: [1 2 3]
    ys:  none
    zs:  intersect' xs1 xs2
    --assert* [ys == zs]

--test-- "[integer!] -> string! -> string!"
    xs1: [1 2 3]
    xs2: "abc"
    ys:  none
    zs:  intersect' xs1 xs2
    --assert* [ys == zs]

--test-- "[string!] -> [integer!] -> [string | string!]"
    xs1: ["abc" "def" "def"]
    xs2: [1 2 3]
    ys:  []
    zs:  intersect' xs1 xs2
    --assert* [ys == zs]

===end-group===

;;Ordered lists

===start-group=== "sort'"

--test-- "[integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [1 2 3]
    zs: sort' xs
    --assert* [ys == zs]

--test-- "[integer!] -> [integer!] 2"
    xs: [3 2 1]
    ys: [1 2 3]
    zs: sort' xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!] 1"
    xs: ["abc" "def"]
    ys: ["abc" "def"]
    zs: sort' xs
    --assert* [ys == zs]

--test-- "[string!] -> [string!] 2"
    xs: ["def" "abc"]
    ys: ["abc" "def"]
    zs: sort' xs
    --assert* [ys == zs]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "abc"
    zs: sort' xs
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "cba"
    ys: "abc"
    zs: sort' xs
    --assert* [ys == zs]

===end-group===

===start-group=== "sortOn"

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [3 2 1]
    zs: sortOn func [x][x * -1] xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 2"
    xs: [3 2 1]
    ys: [3 2 1]
    zs: sortOn func [x][x * -1] xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> [string!] 1"
    xs:  ["az" "aa"]
    ys:   ["aa" "az"]
    zs: sortOn :reverse' xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> [string!] 2"
    xs:  ["aa" "az"]
    ys:   ["aa" "az"]
    zs: sortOn :reverse' xs
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> string! -> string! 1"
    xs:  "abc"
    ys:   "cba"
    zs: sortOn func [x][(to-integer x) * -1] xs
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> string! -> string! 2"
    xs:  "cba"
    ys:   "cba"
    zs: sortOn func [x][(to-integer x) * -1] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "insert'"

--test-- "integer! -> [integer!] -> [integer!] 1"
    xs:  [1 2 3]
    ys:  [0 1 2 3]
    zs:  insert' 0 xs
    --assert* [ys == zs]

--test-- "integer! -> [integer!] -> [integer!] 2"
    xs:  []
    ys:  [0]
    zs:  insert' 0 xs
    --assert* [ys == zs]

--test-- "string! -> [string!] -> [string!] 1"
    xs:  ["ab" "cd" "ef"]
    ys:  ["xy" "ab" "cd" "ef"]
    zs:  insert' "xy" xs
    --assert* [ys == zs]

--test-- "string! -> [string!] -> [string!] 2"
    xs:  []
    ys:  ["xy"]
    zs:  insert' "xy" xs
    --assert* [ys == zs]

--test-- "char! -> string! -> string!"
    xs:  "abcd"
    ys:  "1abcd"
    zs:  insert' #"1" xs
    --assert* [ys == zs]

--test-- "char! -> string! -> string!"
    xs:  ""
    ys:  "1"
    zs:  insert' #"1" xs
    --assert* [ys == zs]

===end-group===

;;Generalized functions
;;User-supplied equality

===start-group=== "nubBy"

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3 4 1]
    ys: [1 2 3 4]
    zs: nubBy (func [x y][x == y]) xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 2"
    xs: []
    ys: []
    zs: nubBy (func [x y][x < y]) xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 3"
    xs: [1 2 3 -1 -2 -3]
    ys: [1 -1 -2 -3]
    zs: nubBy (func [x y][all [(positive? x)  (positive? y)]]) xs
    --assert* [ys == zs]

--test-- "([string!] -> [string!] -> logic!) -> [string!] -> [string!] 1"
    xs: ["ab" "cd" "ab" "ef"]
    ys: ["ab" "cd" "ef"]
    zs: nubBy func [x y][x == y] xs
    --assert* [ys == zs]

--test-- "([string!] -> [string!] -> logic!) -> [string!] -> [string!] 2"
    xs: [""]
    ys: [""]
    zs: nubBy (func [x y][x == y]) xs
    --assert* [ys == zs]

--test-- "string! -> string! -> [[string!]] 1"
    xs: "abcdd"
    ys: "abcd"
    zs: nubBy func [x y][x == y] xs
    --assert* [ys == zs]

--test-- "string! -> string! -> [[string!]] 2"
    xs: ""
    ys: ""
    zs: nubBy func [x y][x < y] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "deleteBy"

--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def"]
    zss: deleteBy func [x y][x == y] "abcd" xss
    --assert* [yss == zss]

--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "def"]
    zss: deleteBy func [x y][x == y] "def" xss
    --assert* [yss == zss]

--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["def" "abc"]
    zss: deleteBy func [x y][x == y] "abc" xss
    --assert* [yss == zss]

--test-- "string! -> (char! -> char! -> logic!) -> string! 1"
    xs: "abc"
    ys: "ac"
    zs: deleteBy func [x y][x == y] #"b" xs
    --assert* [ys == zs]

--test-- "string! -> (char! -> char! -> logic!) -> string! 2"
    xs: "abcABC"
    ys: "abcBC"
    zs: deleteBy func [x y][x == y] #"A" xs
    --assert* [ys == zs]

--test-- "string! -> (char! -> char! -> logic!) -> string! 3"
    xs:  "a b c d"
    ys:  "ab c d"
    zs: deleteBy func [x y][x == y] space xs
    --assert* [ys == zs]

===end-group===

===start-group=== "deleteFirstsBy"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def"]
    zss: deleteFirstsBy func [x y][x == y] xss ["abcd"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "def"]
    zss: deleteFirstsBy func [x y][x == y] xss ["def"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["abc"]
    zss: deleteFirstsBy func [x y][x == y] xss ["abc" "def"]
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "a"
    zs: deleteFirstsBy func [x y][x == y] xs "bc"
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: "abcBC"
    zs: deleteFirstsBy func [x y][x == y] xs "A"
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  "abc"
    zs: deleteFirstsBy func [x y][x == y] xs "   d"
    --assert* [ys == zs]

===end-group===


===start-group=== "unionBy"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def" "abcd"]
    zss: unionBy func [x y][x == y] xss ["abcd"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "def" "def"]
    zss: unionBy func [x y][x == y] xss ["def"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["abc" "def" "abc"]
    zss: unionBy func [x y][x == y] xss ["abc" "def"]
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "abc"
    zs: unionBy func [x y][x == y] xs "bc"
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: "abcABCD"
    zs: unionBy func [x y][x == y] xs "AD"
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  "a b c df"
    zs: unionBy func [x y][x == y] xs "a b cf"
    --assert* [ys == zs]

===end-group===

===start-group=== "intersectBy"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: []
    zss: intersectBy func [x y][x == y] xss ["abcd"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["def" "def"]
    zss: intersectBy func [x y][x == y] xss ["def"]
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["abc" "def" "abc"]
    zss: intersectBy func [x y][x == y] xss ["abc" "def"]
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: "bc"
    zs: intersectBy func [x y][x == y] xs "bc"
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: "A"
    zs: intersectBy func [x y][x == y] xs "AD"
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  "a b c "
    zs: intersectBy func [x y][x == y] xs "a b cf"
    --assert* [ys == zs]

===end-group===

===start-group=== "groupBy"

--test-- "[string!] -> [string!] 1"
    xss: ["abc" "def"]
    yss: [["abc"] ["def"]]
    zss: groupBy func [x y][x == y] xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: [["abc"] ["def" "def"]]
    zss: groupBy func [x y][x == y] xss
    --assert* [yss == zss]

--test-- "[string!] -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: [["abc"] ["def"] ["abc"]]
    zss: groupBy func [x y][x == y] xss
    --assert* [yss == zss]

--test-- "string! -> string! 1"
    xs: "abc"
    ys: ["a" "b" "c"]
    zs: groupBy func [x y][x == y] xs
    --assert* [ys == zs]

--test-- "string! -> string! 2"
    xs: "abcABC"
    ys: ["a" "b" "c" "A" "B" "C"]
    zs: groupBy func [x y][x == y] xs
    --assert* [ys == zs]

--test-- "string! -> string! 3"
    xs:  "a b c d"
    ys:  ["a" " " "b" " " "c" " " "d"]
    zs: groupBy func [x y][x == y] xs
    --assert* [ys == zs]

===end-group===

;;User-supplied comparison
===start-group=== "sortBy"

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 1"
    xs: [1 2 3]
    ys: [1 2 3]
    zs: sortBy (func [x y][x < y]) (copy xs)
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> [integer!] 2"
    xs: [1 2 3]
    ys: [3 2 1]
    zs: sortBy (func [x y][x > y]) (copy xs)
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> [string!] 1"
    xs: ["def" "abc" "ghi"]
    ys: ["abc" "def" "ghi"]
    zs: sortBy (func [x y][x < y]) (copy xs)
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> [string!] 2"
    xs: ["def" "abc" "ghi"]
    ys: ["ghi" "def" "abc"]
    zs: sortBy (func [x y][x > y]) (copy xs)
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> string! -> string! 1"
    xs: "abc"
    ys: "abc"
    zs: sortBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> string! -> string! 2"
    xs: "abc"
    ys: "cba"
    zs: sortBy func [x y][x > y] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "insertBy"
--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 1"
    xss: ["abc" "def"]
    yss: ["abc" "def" "ghi"]
    zss: insertBy func [x y][x < y] "ghi" xss
    --assert* [yss == zss]

--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 2"
    xss: ["abc" "def" "def"]
    yss: ["abc" "bcd" "def" "def"]
    zss: insertBy func [x y][x < y] "bcd" xss
    --assert* [yss == zss]

--test-- "[string!] -> (string! -> string! -> logic!) -> [string!] 3"
    xss: ["abc" "def" "abc"]
    yss: ["abc" "def" "abc" "abc"]
    zss: insertBy func [x y][x > y] "abc" xss
    --assert* [yss == zss]

--test-- "(char! -> char! -> logic!) -> char! -> string! 1"
    xs: "abc"
    ys: "abbc"
    zs: insertBy func [x y][x < y] #"b" xs
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> char! -> string! 2"
    xs: "abcABC"
    ys: "AabcABC"
    zs: insertBy func [x y][x < y] #"A" xs
    --assert* [ys == zs]

--test-- "(char! -> char! -> logic!) -> char! -> string! 3"
    xs:  "a b c d"
    ys:  " a b c d"
    zs: insertBy func [x y][x < y] space xs
    --assert* [ys == zs]

===end-group===

===start-group=== "maximumBy"

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 1"
    xs: []
    ys: none
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 2"
    xs: [1]
    ys: 1
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 3"
    xs: [1 2 3 4]
    ys: 4
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 1"
    xs: []
    ys: none
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 2"
    xs: ["1"]
    ys: "1"
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 3"
    xs: ["1" 2 3 4]
    ys: none
    zs: maximumBy :strict-equal? xs
    --assert* [ys == zs]

===end-group===

===start-group=== "minimumBy"

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 1"
    xs: []
    ys: none
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 2"
    xs: [1]
    ys: 1
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(integer! -> integer! -> logic!) -> [integer!] -> integer! 3"
    xs: [1 2 3 4]
    ys: 1
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 1"
    xs: []
    ys: none
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 2"
    xs: ["1"]
    ys: "1"
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

--test-- "(string! -> string! -> logic!) -> [string!] -> string! 3"
    xs: ["1" 2 3 4]
    ys: none
    zs: minimumBy func [x y][x < y] xs
    --assert* [ys == zs]

===end-group===

===start-group=== "swap'"

--test-- "pair! -> pair!"
    xs: 3x7
    ys: 7x3
    zs: swap' xs
    --assert* [ys == zs]

--test-- "series! -> series!"
    xs: [1 2]
    ys: [2 1]
    zs: swap' xs
    --assert* [ys == zs]

--test-- "string! -> string!"
    xs: "ba"
    ys: "ab"
    zs: swap' xs
    --assert* [ys == zs]

--test-- "integer! -> none!"
    xs: 3
    ys: none
    zs: attempt [swap' xs]
    --assert* [ys == zs]
===end-group===

~~~end-file~~~
