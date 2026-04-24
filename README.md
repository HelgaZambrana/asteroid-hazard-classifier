# Asteroid Hazard Classifier 🚀

Proyecto de Machine Learning para clasificar asteroides cercanos a la Tierra
como potencialmente peligrosos o no, usando datos en tiempo real de la NASA.

Desarrollado en el contexto del lanzamiento de Artemis II (abril 2026).

## Stack

- Python 3.13
- NASA NeoWs API
- Supabase (PostgreSQL)
- scikit-learn, XGBoost, SHAP

## Estructura

asteroid-classifier/
├── data/                          # Generado localmente, no se sube al repo
│   ├── X_train.csv                # Correr 04_preprocessing.ipynb para generar
│   ├── X_test.csv
│   ├── y_train.csv
│   ├── y_test.csv
│   └── scaler.pkl
├── notebooks/
│   ├── 01_api_exploration.ipynb
│   ├── 02_etl.ipynb
│   ├── 03_eda.ipynb
│   └── 04_preprocessing.ipynb
├── .env.example
└── README.md

## Variables de entorno

Copiá `.env.example` a `.env` y completá con tus credenciales:

    NASA_API_KEY=your_nasa_api_key
    SUPABASE_URL=your_supabase_url
    SUPABASE_KEY=your_supabase_key

## Decisiones de diseño

### Deduplicación por asteroide

El mismo asteroide puede tener múltiples close approaches en distintas
fechas. La unidad de análisis del modelo es el asteroide, no el evento
de acercamiento. Se conservó el primer acercamiento registrado por
asteroide (drop_duplicates(subset='id', keep='first')).

En un sistema productivo real lo correcto sería una tabla separada para
eventos de acercamiento con FK a asteroides. Esta es una simplificación
justificada para el alcance del proyecto.