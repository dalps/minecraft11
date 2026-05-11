import { readdirSync, readFileSync, writeFileSync } from "fs";
import { optimize } from "./optimize.js";

readdirSync("svg")
  .filter((filename) => filename.includes(".svg"))
  .forEach((filename) => {
    const data = readFileSync(`svg/${filename}`, { encoding: "utf-8" });
    const prefix = filename.replace(/\.svg/, "");
    console.log(prefix);

    writeFileSync(`svg/${filename}`, optimize(prefix, data));
  });
