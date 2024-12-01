// Home butonuna tıklandığında kartları gösteren fonksiyon
function showCards() {
    const formContainer = document.getElementById('form-container');
    const cardsContainer = document.getElementById('cards');
    
    // Kartları göster ve formu gizle
    cardsContainer.style.display = 'flex';
    formContainer.style.display = 'none';
}

// Dataset butonuna tıklandığında formu gösteren fonksiyon
function showForm() {
    const formContainer = document.getElementById('form-container');
    const cardsContainer = document.getElementById('cards');
    
    // Formu göster ve kartları gizle
    formContainer.style.display = 'block';
    cardsContainer.style.display = 'none';
}

// Sayfa yüklendiğinde, varsayılan olarak kartları göster
document.addEventListener('DOMContentLoaded', function() {
    showCards();
});
