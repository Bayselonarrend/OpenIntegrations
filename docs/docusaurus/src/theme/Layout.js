import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';

export default function CustomLayout(props) {
  useEffect(() => {
    if (!location.pathname.startsWith('/docs/')) {
      return; // Если не на странице документации, не добавляем блок
    }

    // Создаем контейнер для второго рекламного блока
    const adContainer = document.createElement('div');
    adContainer.id = 'yandex_rtb_R-A-12294791-5';
    adContainer.style.marginTop = '20px'; // Добавим отступ для красоты

    // Находим элемент кнопок "Previous" и "Next" и вставляем перед ним
    const paginationElement = document.querySelector('.pagination-nav');
    if (paginationElement) {
      paginationElement.parentNode.insertBefore(adContainer, paginationElement);
    } else {
      // Если кнопок нет, добавляем контейнер в конец body
      document.body.appendChild(adContainer);
    }

    // Создаем скрипт для рендеринга рекламы
    const script = document.createElement('script');
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

        Ya.Context.AdvManager.render({
          "blockId": "R-A-12294791-5",
          "renderTo": "yandex_rtb_R-A-12294791-5"
        });
      });
    `;
    document.body.appendChild(script);

    // Удаляем элементы при размонтировании компонента
    return () => {
      script.remove();
      adContainer.remove();
    };
  }, []);

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
