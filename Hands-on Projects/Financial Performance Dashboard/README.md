# Financial Performance Dashboard

An interactive **R Shiny dashboard** for visualizing corporate financial metrics — including **quarterly revenue** and **expenses** across departments.  
This project demonstrates data-driven decision support using **Shiny**, **Plotly**, and **dplyr**, and can be extended for real business data.

---

## Features

- **Interactive Charts** — visualize revenue and expense trends by department  
- **Dynamic Filters** — select departments to filter key metrics in real time  
- **Clean Dashboard UI** — built using `shinydashboard` for a professional layout  
- **Data Insights** — clear quarterly breakdowns for quick KPI interpretation  

---

## Tech Stack

| Category | Tools Used |
|-----------|-------------|
| Dashboard Framework | `shiny`, `shinydashboard` |
| Visualization | `plotly` |
| Data Wrangling | `dplyr` |
| Language | R (≥ 4.0.0) |

---

## Project Structure

financial-dashboard/
│
├── app.R # Main Shiny app (UI + Server)
├── README.md # Documentation
└── sample_screenshot.png # Optional image to show app UI



## How It Works

- **Synthetic Data Generation** — the app creates quarterly revenue and expense data for each department.
- **Reactive Filtering** — users select a department from the sidebar; charts update dynamically.
- **Interactive Visualization** — revenue is displayed as bars, expenses as line plots for easy comparison.

## Output

When you select R&D department:
- **Left Plot** → Quarterly Revenue (bar chart)
- **Right Plot** → Quarterly Expense Trend (line chart)
You’ll see interactive hover values and zoom functionality (via Plotly).

![Dashboard Preview]()

## Future Enhancements
- Add Profit Margin calculations
- Connect to real financial data (CSV / SQL)
- Include KPIs in info boxes
- Export dashboard views as reports (PDF/PNG)

