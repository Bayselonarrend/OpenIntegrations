import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';

export default function CustomLayout(props) {
  useEffect(() => {

    if (!location.pathname.startsWith('/docs/')) {
      return; // Если нет, не добавляем блок
    }

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

})
    `;
    document.body.appendChild(script);

    // Удаляем элементы при размонтировании компонента
    return () => {
      script.remove();
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