#!/bin/sh

CONFIG="config.txt"
[ -f "$CONFIG" ] || { echo "エラー: $CONFIG が見つかりません"; exit 1; }

# 1. 各イベントの README を自動更新
while read -r ctf_name category_name total color; do
    # コメント行や空行はスキップ
    case "$ctf_name" in
        "#"*|"") continue ;;
    esac

    category_dir="${ctf_name}/${category_name}"
    README="${ctf_name}/README.md"

    [ -d "$category_dir" ] || continue
    [ -f "$README" ] || continue

    # 中に README.md があるフォルダの数（解いた数）をカウント
    solved=0
    for prob_dir in "${category_dir}"/*/; do
        [ -d "$prob_dir" ] || continue
        if [ -f "${prob_dir}README.md" ]; then
            solved=$((solved + 1))
        fi
    done

    percent=0
    [ "$total" -gt 0 ] && percent=$(( solved * 100 / total ))

    # 色のデフォルト判定（指定がない場合や空の場合）
    if [ -z "$color" ]; then
        color="orange"
        [ "$percent" -eq 100 ] && color="brightgreen"
    fi

    badge_label=$(echo "$category_name" | sed 's/_/%20/g')
    new_badge="![${category_name}](https://img.shields.io/badge/${badge_label}-${solved}%2F${total}%20(${percent}%25)-${color}?style=flat-square)"

    if grep -q "badge/${badge_label}-" "$README" 2>/dev/null; then
        sed -i "s#\!\[${category_name}\](https://img.shields.io/badge/${badge_label}-.*)#${new_badge}#g" "$README"
    else
        echo "$new_badge" >> "$README"
    fi

done < "$CONFIG"

# 2. Gitでまとめて追加・コミット・プッシュ
git add .
git commit -m "update: auto-update ctf badges and writeups"
git push origin main
