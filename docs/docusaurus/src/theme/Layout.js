import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';

export default function CustomLayout(props) {
  useEffect(() => {
    // Создаем <div> для блока Яндекса в конце body
    const adDiv = document.createElement('div');
    adDiv.id = 'yandex_rtb_R-A-12294791-1';
    adDiv.style.height = '200px';
    document.body.appendChild(adDiv);

    // Добавляем скрипт для отображения рекламы
    const script = document.createElement('script');
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

    // Удаляем элементы при размонтировании компонента
    return () => {
      document.body.removeChild(adDiv);
      document.body.removeChild(script);
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