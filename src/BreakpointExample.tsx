import React from 'react';

const BreakpointExample: React.FC = () => {
  const cards = [
    { title: 'ニュース', icon: '📰', content: '最新のテクノロジーニュース：AIが新たな進化を遂げる', color: 'text-red-600' },
    { title: '天気予報', icon: '🌤', content: '東京の天気：晴れ、最高気温28℃、最低気温20℃', color: 'text-yellow-500' },
    { title: 'スケジュール', icon: '📅', content: '次の予定：14:00からチームミーティング', color: 'text-green-500' },
    { title: 'タスク', icon: '✅', content: '優先タスク：プレゼンテーション資料の作成', color: 'text-blue-500' },
    { title: 'メッセージ', icon: '💬', content: '新着メッセージ：3件の未読メッセージがあります', color: 'text-indigo-500' },
    { title: '株価情報', icon: '📈', content: '日経平均：前日比1.2%上昇', color: 'text-violet-500' },
  ];

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-r from-purple-400 to-pink-500 p-4">
      <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-8xl font-bold text-center mb-8 transition-all duration-300 text-white">
        Responsive Dashboard
      </h1>
      <div className="text-center mb-8">
        <p className="text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl mb-2 transition-all duration-300 text-white">
          Current Breakpoint:
        </p>
        <p className="font-bold text-4xl transition-all duration-300">
          <span className="sm:hidden text-red-600">Default (&lt; 640px)</span>
          <span className="hidden sm:inline md:hidden text-yellow-500">SM (≥ 640px)</span>
          <span className="hidden md:inline lg:hidden text-green-500">MD (≥ 768px)</span>
          <span className="hidden lg:inline xl:hidden text-blue-500">LG (≥ 1024px)</span>
          <span className="hidden xl:inline 2xl:hidden text-indigo-500">XL (≥ 1280px)</span>
          <span className="hidden 2xl:inline text-violet-500">2XL (≥ 1536px)</span>
        </p>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3 gap-4 w-full max-w-6xl">
        {cards.map((card, index) => (
          <div key={index} className={`bg-white p-4 rounded-lg shadow-md transition-all duration-300 transform hover:scale-105 border-t-4 ${card.color.replace('text', 'border')}`}>
            <div className="flex items-center justify-between mb-2">
              <h2 className={`text-lg font-semibold ${card.color}`}>{card.title}</h2>
              <span className="text-2xl" role="img" aria-label={card.title}>{card.icon}</span>
            </div>
            <p className="text-sm text-gray-600">{card.content}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default BreakpointExample;
