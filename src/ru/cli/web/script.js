document.addEventListener('DOMContentLoaded', function () {
    // Функция для изменения ширины боковой панели
    function resizeSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const resizer = document.querySelector('.resizer');

        if (!sidebar || !resizer) {
            console.warn('Sidebar or resizer not found.');
            return;
        }

        let startX, startWidth;

        resizer.addEventListener('mousedown', function (e) {
            startX = e.pageX - sidebar.offsetLeft;
            startWidth = parseInt(getComputedStyle(sidebar).width, 10);
            document.documentElement.style.cursor = 'col-resize';
            document.body.style.userSelect = 'none'; // Отключаем выделение текста

            document.addEventListener('mousemove', onMouseMove);
            document.addEventListener('mouseup', onMouseUp);
        });

        function onMouseMove(e) {
            const width = startWidth + (e.pageX - startX);
            if (width >= 100 && width <= window.innerWidth - 200) { // Минимальная и максимальная ширина
                sidebar.style.width = `${width}px`;
            }
        }

        function onMouseUp() {
            document.documentElement.style.cursor = 'default';
            document.body.style.userSelect = 'auto';
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        }
    }

    // Инициализация функции изменения ширины боковой панели
    function initResizeSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const resizer = document.querySelector('.resizer');

        if (sidebar && resizer) {
            resizeSidebar();
        } else {
            console.warn('Sidebar or resizer not found. Retrying...');
            setTimeout(initResizeSidebar, 100); // Попробуем снова через 100 мс
        }
    }

    // Вызываем инициализацию после загрузки DOM
    initResizeSidebar();

    // Подписываемся на событие htmx:afterSwap, чтобы инициализировать заново при обновлении контента
    document.body.addEventListener('htmx:afterSwap', function (event) {
        initResizeSidebar();
    });
});