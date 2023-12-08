<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html lang="pl" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css" />
    <script src="http://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="resources/js/app.js"></script>
    <script src="resources/js/summary.js"></script>
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="index.html" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="index.html#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.html#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br />
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form method="POST"
              th:action="@{/addDonation}" th:object="${donation}">

            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <div class="form-group form-group--checkbox" th:each="category : ${categories}">
                    <label th:for="${category.name}">
                        <input type="checkbox" th:name="category" th:id="${category.name}" th:value="${category}" th:field="${category}">
                        <span class="checkbox"></span>
                        <span class="description"
                        >${category.name}</span
                        >
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label for="quantity">
                        Liczba 60l worków:</label>
                    <input type="number"th:field="${quantity}" id="quantity" />
                    <span th:if="${#fields.hasErrors('quantity')}" th:class="${#fields.hasErrors('age')}? error">Musi być liczba</span>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <div class="form-group form-group--checkbox" th:each="institution : ${institutions}">
                    <label th:for="${institution.name}">
                        <input type="radio" th:name="institution" th:id="${institution.name}" th:value="${institution}" th:field="${institution}">
                        <span class="checkbox radio"></span>
                        <span class="description">
                            <div class="title" th:text="${'Fundacja ' + institution.name}"></div>
                            <div class="subtitle" th:text="${'Cel i misja: ' + institution.description}"></div>
                        </span>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label for="street">Ulica</label>
                            <input type="text" id="street" th:field="${street}"/>
                            <span th:if="${#fields.hasErrors('street')}" th:errors="*{street}">Muszą być conajmniej 3 znaki</span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="city" >Miasto</label>
                            <input type="text" th:field="${city}" id="city"/>
                            <span th:if="${#fields.hasErrors('city')}" th:errors="*{city}"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="zipCode">Kod pocztowy</label>
                            <input type="text" th:field="${zipCode}" id="zipCode"/>
                            <span th:if="${#fields.hasErrors('zipCode')}" th:errors="*{zipCode}"></span>
                        </div>


                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="phone" id="phone" name="phone" />
                            </label>
                        </div>

                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label for="pickUpDate" >Data</label>
                            <input type="date" th:field="${pickUpDate}" id="pickUpDate"/>
                            <span th:if="${#fields.hasErrors('pickUpDate')}" th:errors="*{pickUpDate}"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="pickUpTime">Godzina</label>
                            <input type="time" th:field="pickUpTime" id="pickUpTime" />
                            <span th:if="${#fields.hasErrors('pickUpTime')}" th:errors="*{pickUpTime}"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="pickUpComment" >Uwagi do kuriera</label>
                            <textarea th:field="${pickUpComment}" id="pickUpComment"/>
                            <span th:if="${#fields.hasErrors('pickUpComment')}" th:errors="*{pickUpComment}"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text" id="summary-quantity-category"
                                >m</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text" id="summary-institution"
                                >m</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li><p id="summary-street">m</p></li>
                                <li><p id="summary-city">m</p> </li>
                                <li><p id="summary-zipCode">m</p></li>
                                <li><p id="summary-phone">m</p></li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li><p id="summary-pickUpDate">m</p></li>
                                <li><p id="summary-pickUpTime">m</p> </li>
                                <li><p id="summary-pickUpComment">m</p></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form>
    </div>
</section>
<script>
    $(function() {
        $('.btn').click(function () {
            updateSummary();
        });
    });
</script>
</body>
</html>
