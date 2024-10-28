document.addEventListener('DOMContentLoaded', function() {
    const statusButtons = document.querySelectorAll('.status-btn');
    const orderCards = document.querySelectorAll('.order-card');

    const initialStatus = 'pending';

    statusButtons.forEach(button => {
        if (button.getAttribute('data-status') === initialStatus) {
            button.classList.add('active'); 
        }
    });

    orderCards.forEach(card => {
        if (card.getAttribute('data-status') === initialStatus) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });

    statusButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active class from all buttons
            statusButtons.forEach(btn => btn.classList.remove('active'));
            
            // Add active class to clicked button
            this.classList.add('active');

            const status = this.getAttribute('data-status');

            // Filter order cards based on status
            orderCards.forEach(card => {
                if (status === 'all' || card.getAttribute('data-status') === status) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
});
