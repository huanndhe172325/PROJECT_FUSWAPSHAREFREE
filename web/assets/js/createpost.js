document.addEventListener('DOMContentLoaded', (event) => {
    const inputs = document.querySelectorAll('input[name="typePost"]');
    const titleDesire = document.getElementById('titleDesire');
    const inputDesire = document.getElementById('desire');

    const toggleDisplay = () => {
        const isExchangeChecked = Array.from(inputs).some(input => input.checked && input.value === '1');
        titleDesire.style.display = isExchangeChecked ? 'block' : 'none';
        inputDesire.style.display = isExchangeChecked ? 'block' : 'none';
    };
    toggleDisplay();
    inputs.forEach(input => input.addEventListener('change', toggleDisplay));
});


