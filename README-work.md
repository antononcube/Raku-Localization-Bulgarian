# Localization::Bulgarian - Raku на български език

**English summary:** This is a Bulgarian language package for Raku programming, providing over 200 Bulgarian function names that cover all aspects of the Raku language. 
It allows Bulgarian speakers to write Raku code in their native language. 
This first version has incomplete coverage, due to existing limitations, expect refinements and changes in future versions as we move towards complete functionality and true multilingual programming. 
Your input is welcome, see https://github.com/antononcube/Raku-Localization-Bulgarian .

This package closely follows the Raku package "Russian", [DSp1].

**Резюме:** Това е пакет за програмиране на Raku на български език, който предоставя над 200 български имена на функции, покриващи всички аспекти на езика Raku.
Той позволява на българоговорящите да пишат код на Raku на родния си език.
Тази първа версия има непълно покритие, поради съществуващи ограничения, очаквайте уточнения и промени в бъдещите версии, докато се движим към пълна функционалност и истинско многоезично програмиране.
Вашият принос е добре дошъл, вижте https://github.com/antononcube/Raku-Localization-Bulgarian .

Този пакет следва до голяма степен Raku пакета "Russian", [DSp1].

### Примери за употреба

### Функционално програмиране

```raku
use Bulgarian;

my @числа = 1 .. 10;
my @квадрати = изобрази({ $_ ** 2 }, @числа);
my @четни = филтрирай({ $_ %% 2 }, @числа);
my $сума = свий({ $^a + $^b }, @числа);

кажи "Квадрати: @квадрати[]";
кажи "Четни: @четни[]";
кажи "Сума: $сума";
```

```raku
# Создаваме алгоритъм за изчисление на факториели
my &факториал = алгоритъм(-> $n {
    $n <= 1 ?? 1 !! $n * факториел($n - 1)
});

кажи &факториал(10);
```

```raku
# Исползваме брояч
кажи "Брояч: ", брояч() xx 3;
```

```raku
# Работа с ЕИМ
кажи "Архитектура ЕИМ: ", архитектура();
```

-----

## References

[DSp1] Danslav Slavenskoj,
["Russian" Raku package](https://github.com/raku-multilingual/raku-russian),
(2025),
[GitHub/raku-multilingual](https://github.com/raku-multilingual).