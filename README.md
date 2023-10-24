# Vet Clinic Database

> This is a project to practice SQL queries. It is a database for a vet clinic.

The database contains the following tables:
`animals` with the following columns:
```
id: integer

name: string

date_of_birth: date

escape_attempts: integer

neutered: boolean

weight_kg: decimal
```

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Used [schema.sql](./schema.sql) to create all tables.
- Used [data.sql](./data.sql) to populate tables with sample data.
- [queries.sql](./queries.sql) contains queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

<!--
HOW TO USE:
This is an example of how you may give instructions on setting up your project locally.

Modify this file to match your project and remove sections that don't apply.

REQUIRED SECTIONS:
- Table of Contents
- About the Project
  - Built With
  - Live Demo
- Getting Started
- Authors
- Future Features
- Contributing
- Show your support
- Acknowledgements
- License

After you're finished please remove all the comments and instructions!
-->


<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet Clinic Database <a name="about-project"></a>

> This is a relational database to create the data structure for a vet clinic.

**Vet Clinic** will have the following tables:
<!-- create a markdown list -->
- `animals`
- `animals owners`
- `clinic employees`
- `visits`


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>


<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Create tables**
- **Populate data to the tables**
- **Make queries to the tables**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```sh
 postgress sql installed in your computer
```


### Setup

Clone this repository to your desired folder:


commands:

```sh
  cd my-folder
  git clone git@github.com:Ochiengsteven/the-vet-clinic.git
```


### Usage

To run the project:

```sh
  run the queries.sql file in your postgress sql
```



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>

- GitHub: [@Ochiengsteven](https://github.com/Ochiengsteven)
- Twitter: [@Ochiengsteven](https://twitter.com/legringo_madd)
- LinkedIn: [Ochieng Steven](https://www.linkedin.com/in/steven-ochieng-a43125179/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add animals' owners table**
- [ ] **Add clinic employees table**
- [ ] **Add visits table**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give me a ⭐️!


<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank microverse for giving me this opportunity to learn and build this project.

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>