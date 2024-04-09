$(document).ready(function () {
    $('#search').on('input', function () {
        var searchQuery = $(this).val().toLowerCase();
        var firstRow = true;

        // Проходим по всем строкам таблицы
        $('bigtable tbody tr').each(function () {
            var specName = $(this).find('td:fifth').text().toLowerCase();

            // Если название препарата содержит поисковый запрос, показываем строку
            if (specName.includes(searchQuery)) {
                $(this).show();

                // Если это первая строка, которая отображается, удаляем у нее верхний отступ
                if (firstRow) {
                    $(this).find('td').css('border-top', 'none');
                    firstRow = false;
                } else {
                    // Для всех остальных строк возвращаем верхний отступ
                    $(this).find('td').css('border-top', '');
                }
            } else {
                // Иначе скрываем строку
                $(this).hide();
            }
        });
    });
});