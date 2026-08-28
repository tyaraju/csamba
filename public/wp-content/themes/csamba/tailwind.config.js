/** @type {import('tailwindcss').Config} */
export default {
  content: ['./*.php', './inc/**/*.php', './template-parts/**/*.php', './src/js/**/*.js'],
  theme: {
    extend: {
      maxWidth: { site: '1280px' },
      fontFamily: { avant: ['ITC Avant Garde Gothic LT Bold', 'Arial', 'sans-serif'] }
    }
  },
  plugins: []
};
