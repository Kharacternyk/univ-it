const fs = require("fs");
const http = require("http");
const soap = require("soap");

const server = http.createServer((request, response) => {
  response.end("Not Found\n");
});

const wsdl = fs.readFileSync("database.wsdl", "utf8");

const service = {
  DatabaseService: {
    DatabasePort: {
      CreateDatabase: (arguments) => {
        console.log(arguments);

        return { ok: true };
      },

      GetDatabase: (arguments) => {
        console.log(arguments);

        return { name: "hello" };
      },
    },
  },
};

server.listen(8000);
soap.listen(server, "/wsdl", service, wsdl);
