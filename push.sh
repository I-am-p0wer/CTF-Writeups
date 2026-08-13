#!/bin/sh

README="README.md"

# 1. 316ctf配下のカテゴリフォルダを自動検出してループ処理
for category_dir in 316ctf/*/; do
    [ -d "$category_dir" ] || continue
    
    # カテゴリ名を取得 (例: Password_Cracking)
    category_name=$(basename "$category_dir")
    
    # 総問題数 ＝ フォルダ数
    total=$(find "$category_dir" -mindepth 1 -maxdepth 1 -type d | wc -l)
    [ "$total" -eq 0 ] && continue

    # クリア数 ＝ フォルダ数（すべて完了扱い）
    solved=$("$total") # そのまま total と同じ値にする

    # パーセンテージ計算 (100%)
    percent=$(( solved * 100 / total ))

    # 色 (100%なのでbrightgreen固定、あるいは状況に合わせて調整可能)
    color="brightgreen"

    # URLエンコード用 (_ を %20 に)
    badge_label=$(echo "$category_name" | sed 's/_/%20/g')

    # 生成するバッジのマークダウン
    new_badge="![${category_name}](https://img.shields.io/badge/${badge_label}-${solved}%2F${total}%20(${percent}%25)-${color}?style=flat-square)"

    # README.mdにそのカテゴリのバッジがあるか確認して置換、なければ追加
    if grep -q "badge/${badge_label}-" "$README"; then
        sed -i "s#\!\[${category_name}\](https://img.shields.io/badge/${badge_label}-.*)#${new_badge}#g" "$README"
    else
        echo "$new_badge" >> "$README"
    fi
done

# 2. Gitでまとめて追加・コミット・プッシュ
git add .
git commit -m "update: auto-update category badges and writeups"
git push origin main
