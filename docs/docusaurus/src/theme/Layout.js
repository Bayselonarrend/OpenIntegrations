import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';
import { useLocation } from '@docusaurus/router';

export default function CustomLayout(props) {
  const location = useLocation();

  useEffect(() => {
    // Проверяем, находимся ли мы на странице документации
    if (!location.pathname.startsWith('/docs/')) {
      return; // Если нет, не выполняем код для рекламы
    }

    // Функция для рендеринга рекламы
    const renderAds = () => {
      // Удаляем предыдущий скрипт рендеринга, если он существует
      const existingScript = document.getElementById('yandex-ad-script');
      if (existingScript) {
        existingScript.remove();
      }

      // Создаем новый скрипт для рендеринга рекламы
      const script = document.createElement('script');
      script.id = 'yandex-ad-script';
      script.innerHTML = `
      window.yaContextCb.push(() => {
          Ya.Context.AdvManager.render({
              "blockId": "R-A-12294791-3",
              "type": "floorAd",
              "platform": "touch"
          });
          Ya.Context.AdvManager.render({
              "blockId": "R-A-12294791-4",
              "type": "floorAd",
              "platform": "desktop"
          });

      })
          `;
      document.body.appendChild(script);
    };

    // Рендерим рекламные блоки при загрузке страницы или изменении маршрута
    renderAds();

    // Удаляем блоки при размонтировании или смене страницы
    return () => {
      const existingScript = document.getElementById('yandex-ad-script');
      if (existingScript) existingScript.remove();
    };
  }, [location.pathname]); // Следим за изменением пути

  return (
    <>
      <Head>
        <script>
          window.yaContextCb = window.yaContextCb || [];
        </script>
        <script src="https://yandex.ru/ads/system/context.js" async></script>
      </Head>
      <Layout {...props} />
    </>
  );
}