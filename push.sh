#!/bin/sh

# 対象を 316ctf/README.md に指定
README="316ctf/README.md"

# 1. 316ctf配下のカテゴリフォルダを自動検出してループ処理
for category_dir in 316ctf/*/; do
    [ -d "$category_dir" ] || continue
    
    category_name=$(basename "$category_dir")
    
    # 中にファイルが存在する問題フォルダだけをカウント
    total=0
    for prob_dir in "$category_dir"/*/; do
        [ -d "$prob_dir" ] || continue
        if [ -n "$(find "$prob_dir" -mindepth 1 -maxdepth 1)" ]; then
            total=$((total + 1))
        fi
    done
    
    [ "$total" -eq 0 ] && continue

    solved=$total
    percent=100
    color="brightgreen"

    badge_label=$(echo "$category_name" | sed 's/_/%20/g')
    new_badge="![${category_name}](https://img.shields.io/badge/${badge_label}-${solved}%2F${total}%20(${percent}%25)-${color}?style=flat-square)"

    # 316ctf/README.md のバッジを置換、なければ末尾に追加
    if grep -q "badge/${badge_label}-" "$README" 2>/dev/null; then
        sed -i "s#\!\[${category_name}\](https://img.shields.io/badge/${badge_label}-.*)#${new_badge}#g" "$README"
    else
        echo "$new_badge" >> "$README"
    fi
done

# 2. Gitでまとめて追加・コミット・プッシュ
git add .
git commit -m "update: auto-update 316ctf badges and writeups"
git push origin main
