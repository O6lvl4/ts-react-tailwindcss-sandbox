#!/bin/bash

# プロジェクト名を引数から取得
PROJECT_NAME=$1

# プロジェクト名が指定されていない場合はエラーを表示して終了
if [ -z "$PROJECT_NAME" ]; then
    echo "エラー: プロジェクト名を指定してください"
    echo "使用方法: $0 <プロジェクト名>"
    exit 1
fi

# Viteを使用してReact + TypeScriptプロジェクトを作成
npm create vite@latest $PROJECT_NAME -- --template react-ts
cd $PROJECT_NAME

# 依存関係をインストール
npm install

# TailwindCSSとその依存関係をインストール
npm install -D tailwindcss postcss autoprefixer

# TailwindCSSの設定ファイルを初期化
npx tailwindcss init -p

# tailwind.config.jsファイルを更新
cat << EOF > tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# src/index.cssファイルを更新
cat << EOF > src/index.css
@import 'tailwindcss/base';
@import 'tailwindcss/components';
@import 'tailwindcss/utilities';

/* 他のカスタムスタイルがあればここに追加 */
EOF

# src/App.tsxファイルを更新してTailwindCSSのクラスを使用
cat << EOF > src/App.tsx
import React from 'react'

function App() {
  return (
    <div className="flex items-center justify-center h-screen bg-gray-100">
      <h1 className="text-4xl font-bold text-blue-600">
        Vite + React + TypeScript + Tailwind CSS
      </h1>
    </div>
  )
}

export default App
EOF

echo "プロジェクトのセットアップが完了しました！"
echo "cd $PROJECT_NAME を実行してプロジェクトディレクトリに移動し、"
echo "npm run dev を実行して開発サーバーを起動してください。"
