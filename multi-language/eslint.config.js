import js from '@eslint/js'
import globals from 'globals'
import tseslint from 'typescript-eslint'
import pluginReact from 'eslint-plugin-react'
import { defineConfig, globalIgnores } from 'eslint/config'
import stylistic from '@stylistic/eslint-plugin'
import vitest from '@vitest/eslint-plugin'

export default defineConfig([
  { files: ['**/*.{js,mjs,cjs,ts,jsx,tsx}'] },
  globalIgnores(['**/dist/']),
  stylistic.configs.recommended,
  { plugins: { js }, extends: ['js/recommended'] },
  { languageOptions: { globals: { ...globals.browser, ...globals.node } } },
  tseslint.configs.recommended,
  {
    ...pluginReact.configs.flat.recommended,
    settings: {
      react: {
        version: '19',
      },
    },
  },
  pluginReact.configs.flat['jsx-runtime'],
  {
    files: [
      'tests/**.{js,mjs,cjs,ts,jsx,tsx}',
      '__tests__/**.{js,mjs,cjs,ts,jsx,tsx}',
      '**/test*.{js,mjs,cjs,ts,jsx,tsx}',
      '**/*.test.{js,mjs,cjs,ts,jsx,tsx}'
    ],
    ...vitest.configs.recommended,
    languageOptions: {
      globals: {
        ...vitest.environments.env.globals,
      },
    },
  },
  {
    languageOptions: {
      globals: {
        react: 'readonly',
        React: 'readonly',
      },
    },
    rules: {
      'react/prop-types': [0],
      'react/react-in-jsx-scope': 0,
      'react/jsx-uses-react': 0,
      '@typescript-eslint/no-unused-vars': [
        'error',
        {
          args: 'all',
          argsIgnorePattern: '^_',
          caughtErrors: 'all',
          caughtErrorsIgnorePattern: '^_',
          destructuredArrayIgnorePattern: '^_',
          varsIgnorePattern: '^_',
          ignoreRestSiblings: true,
        },
      ],
    },
  },
])
