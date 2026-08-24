## [15pt][INTRO]Corporate_Hotline

Many challenges in BrunnerCTF are dynamic and instanced. This means you have to click a button to spin up a challenge which is only available to your team.

You will either get a link to a website or a connection string you can copy-paste to connect to the challenge. This is typically easiest with netcat or using the pwntools library in a Python script.

Let's try it out! Corporate has a hotline you can connect to - maybe they have something interesting to say?

Click the Start Challenge button below and try connecting with ncat!

NOTE: Some challenges are heavier than others to spin up and you might need to wait for a few minutes before they are available and ready.

## Solution

```bash
$ ncat --ssl corporate-hotline-36244f57454a7943-global.challs.brunnerne.xyz 1337
Welcome to the Brunnerne Inc. Corporate Hotline™

Press 1 to speak to Sales
Press 2 to contact the IT Helpdesk
Press 3 for important corporate information
```
1を選択
```bash
> 1
All sales representatives are currently maximizing shareholder value
```

2を選択
```Bash
> 2
Have you tried turning it off and on again?
```
3を選択
```bash
> 3
brunner{your_call_is_very_important_to_us}
```
3が正解だった。
## Flag
```
brunner{your_call_is_very_important_to_us}
```