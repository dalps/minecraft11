import { readdirSync, readFileSync, writeFileSync } from "fs";
import svgo from "svgo";

readdirSync("svg")
  .filter((filename) => filename.includes(".svg"))
  .forEach((filename) => {
    const data = readFileSync(`svg/${filename}`, { encoding: "utf-8" });
    const prefix = filename.replace(/\.svg/, "");
    console.log(prefix);
    const optimized = svgo.optimize(data, {
      js2svg: { pretty: true, indent: 2 },

      plugins: [
        {
          name: "prefixIds",
          params: {
            prefix,
          },
        },
      ],
    });

    writeFileSync(`svg/${filename}`, optimized.data);
  });
