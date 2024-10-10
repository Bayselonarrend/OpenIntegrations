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

      // Удаляем основной скрипт Yandex, если он есть
      const existingYandexScript = document.getElementById('yandex-ads-context-script');
      if (existingYandexScript) {
        existingYandexScript.remove();
      }

      // Создаем новый скрипт для основного Yandex Ads
      const yandexScript = document.createElement('script');
      yandexScript.id = 'yandex-ads-context-script';
      yandexScript.src = `https://yandex.ru/ads/system/context.js?timestamp=${Date.now()}`;
      yandexScript.async = true;
      document.head.appendChild(yandexScript);

      // Ждем, пока основной скрипт загрузится, чтобы выполнить рендеринг рекламы
      yandexScript.onload = () => {
        // Создаем новый скрипт для рендеринга рекламы
        const script = document.createElement('script');
        script.id = 'yandex-ad-script';
        script.innerHTML = `
          window.yaContextCb.push(() => {
            Ya.Context.AdvManager.render({
              blockId: "R-A-12294791-1",
              renderTo: "yandex_rtb_R-A-12294791-1",
              type: "feed"
            });
          });
        `;
        document.body.appendChild(script);
      };
    };

    // Рендерим рекламные блоки при загрузке страницы или изменении маршрута
    renderAds();

    // Удаляем скрипт при размонтировании или смене страницы
    return () => {
      const existingScript = document.getElementById('yandex-ad-script');
      const existingYandexScript = document.getElementById('yandex-ads-context-script');
      if (existingScript) existingScript.remove();
      if (existingYandexScript) existingYandexScript.remove();
    };
  }, [location.pathname]); // Следим за изменением пути

  return (
    <>
      <Head>
        <script>
          window.yaContextCb = window.yaContextCb || [];
        </script>
      </Head>
      <Layout {...props} />
    </>
  );
}
