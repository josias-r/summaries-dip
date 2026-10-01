#show table.cell.where(x: 1): set text(fill: gray)

= JS/TS to Python: Core Concepts Cheatsheet

== 1. Core Syntax & Logic

#rect(inset: 1pt)[
  #table(
    columns: (1.5fr, 1fr, 1fr),
    align: left,
    stroke: none,
    [Null values], [`null`], [`None`],
    [String Interpolation], [raw("`Hi ${name}`")], [`f"Hi {name}"`],
    [Ternary Operator], [`cond ? a : b`], [`a if cond else b`],
    [Arrow Functions], [`(x) => x * 2`], [`lambda x: x * 2`],
  )
]

== 2. Arrays (Lists) & Strings

#rect(inset: 1pt)[
  #table(
    columns: (1.5fr, 1fr, 1fr),
    align: left,
    stroke: none,
    [Includes / IndexOf], [`arr.includes(x)`], [`x in arr`],
    [Array Join], [`arr.join("-")`], [`"-".join(arr)`],
    [Array Slicing (Start)], [`arr.slice(0, 3)`], [`arr[0:3]`],
    [Array Slicing (End)], [`arr.slice(-2)`], [`arr[-2:]`],
    [Destructuring (Rest)], [`const [a, ...rest] = arr`], [`a, *rest = arr`],
    [Map / Filter], [`arr.filter(x => x>1).map(...)`], [`[x for x in arr if x > 1]`],
  )
]


== 3. Objects (Dictionaries)

#rect(inset: 1pt)[
  #table(
    columns: (1.5fr, 1fr, 1fr),
    align: left,
    stroke: none,
    [Safe Property Access], [`obj.key ?? "fallback"`], [`obj.get("key", "fallback")`],
    [Object Spread], [`{...obj}`], [`{**obj}`],
    [Iterating Keys/Values], [`Object.entries(obj)`], [`obj.items()`],
  )

]

== 4. Classes & Error Handling

#rect(inset: 1pt)[
  #table(
    columns: (1.5fr, 1fr, 1fr),
    align: left,
    stroke: none,
    [Class Constructor],
    [`constructor(name) { this.name = name }`],
    [`def __init__(self, name):` \ `    self.name = name`],

    [Instantiation], [`new User("Alex")`], [`User("Alex")`],
    [Try / Catch], [`catch (err) { ... }`], [`except Exception as err:`],
  )
]

== 5. Async & Modules

#rect(inset: 1pt)[
  #table(
    columns: (1.5fr, 1fr, 1fr),
    align: left,
    stroke: none,
    [Async Functions], [`async function fetch()`], [`async def fetch():`],
    [Promise.all], [`await Promise.all([a, b])`], [`await asyncio.gather(a, b)`],
    [Import & Alias], [`import { a as b } from 'c'`], [`from c import a as b`],
    [Module Namespace], [`import * as pd from 'pandas'`], [`import pandas as pd`],
  )
]
