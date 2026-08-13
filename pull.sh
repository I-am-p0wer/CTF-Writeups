o "==> リモートの最新変更をフェッチ＆リベースで取り込んでいます..."
git pull origin main --rebase

if [ $? -eq 0 ]; then
	    echo "==> リモートの取り込みが完了しました！"
    else
	        echo "==> エラー: コンフリクト等が発生しました。手動で確認してください。"
		    exit 1
fi

