const fs = require("fs");
const http = require("http");
const soap = require("soap");

const server = http.createServer((request, response) => {
  response.end("Not Found\n");
});

const wsdl = fs.readFileSync("database.wsdl", "utf8");

const restUrl = "http://localhost:8123/";

const service = {
  DatabaseService: {
    DatabasePort: {
      CreateDatabase: async (database, respond) => {
        const url = restUrl + "databases/" + database.name;

        await fetch(url, { method: "put" });

        for (const table of database.table ?? []) {
          const tablesUrl = url + "/tables";
          const response = await fetch(tablesUrl, { method: "put" });
          const responseBody = await response.json();
          const tableUrl = tablesUrl + "/" + responseBody.index;

          await fetch(tableUrl, {
            method: "post",
            body: JSON.stringify({ name: table.name }),
          });

          for (const column of table.column ?? []) {
            const columnsUrl = tableUrl + "/columns";
            const response = await fetch(columnsUrl, {
              method: "put",
              body: JSON.stringify({ type: "s" }),
            });
            const responseBody = await response.json();
            const columnUrl = columnsUrl + "/" + responseBody.index;

            await fetch(columnUrl, {
              method: "post",
              body: JSON.stringify({ name: column.name }),
            });
          }

          let rowCount = 0;

          if (table.column && table.column[0] && table.column[0].cell) {
            rowCount = table.column[0].cell.length;
          }

          for (let i = 0; i < rowCount; ++i) {
            await fetch(tableUrl + "/rows", {
              method: "put",
            });
          }

          let columnIndex = 0;

          for (const column of table.column ?? []) {
            for (let i = 0; i < rowCount; ++i) {
              await fetch(
                tableUrl + "/columns/" + columnIndex + "/cells/" + i,
                {
                  method: "post",
                  body: JSON.stringify(column.cell[i]),
                }
              );
            }

            ++columnIndex;
          }
        }

        respond({ ok: true });
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
