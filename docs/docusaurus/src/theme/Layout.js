import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';
import { useLocation } from '@docusaurus/router';

export default function CustomLayout(props) {
  const location = useLocation();

  useEffect(() => {
    if (!location.pathname.startsWith('/docs/')) {
      return; 
    }

    const existingAdContainer = document.getElementById('yandex_rtb_R-A-12294791-5');
    if (existingAdContainer) {
      existingAdContainer.innerHTML = '';
    }

    let adContainer = existingAdContainer;
    if (!adContainer) {
      adContainer = document.createElement('div');
      adContainer.id = 'yandex_rtb_R-A-12294791-5';
      adContainer.style.marginTop = '20px'; 

      const paginationElement = document.querySelector('.pagination-nav');
      if (paginationElement) {
        paginationElement.parentNode.insertBefore(adContainer, paginationElement);
      } else {
        document.body.appendChild(adContainer);
      }
    }

    // Создаем скрипт для рендеринга рекламы
    const script = document.createElement('script');
    script.innerHTML = `
      window.yaContextCb.push(() => {
        Ya.Context.AdvManager.destroy('yandex_rtb_R-A-12294791-5'); // Удаляем предыдущий экземпляр блока
        Ya.Context.AdvManager.render({
          "blockId": "R-A-12294791-3",
          "type": "floorAd",
          "platform": "touch"
        });

        Ya.Context.AdvManager.render({
          "blockId": "R-A-12294791-5",
          "renderTo": "yandex_rtb_R-A-12294791-5"
        });
      });
    `;
    document.body.appendChild(script);

    return () => {
      script.remove();
      adContainer.innerHTML = ''; 
    };
  }, [location.pathname]);

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
