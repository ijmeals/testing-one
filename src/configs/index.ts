const configs = {
  appPort: Number(process.env.SERVER_PORT),
  requestOriginWhitelistUrls: [
    "http://localhost:3001",
  ],
  api: {
    tdameritrade: {
      consumerKey: process.env.TDAMERITRADE_CONSUMER_KEY!,
      url: "https://api.tdameritrade.com/v1/",
    },
  },
  db: {
    primary: {
      driver: "pg",
      database: process.env.APP_DB_NAME!,
      username: process.env.APP_DB_USER!,
      password: process.env.APP_DB_PASSWORD!,
      host: process.env.APP_DB_HOST!,
      port: Number(process.env.APP_DB_PORT!),
    },
  },
};

export default Object.freeze(configs);
