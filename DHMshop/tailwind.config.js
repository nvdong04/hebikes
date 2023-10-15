/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./src/**/*.{html,css,aspx}",
    ],
  theme: {
    extend: {
        screens: {
            'xl': '1200px', // Adds a new `3xl:` screen variant
        },
    },
    },
    plugins: [
        // eslint-disable-next-line global-require
        require('@tailwindcss/forms'),
    ],
}

