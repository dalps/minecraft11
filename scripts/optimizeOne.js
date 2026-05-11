import { readFileSync, writeFileSync } from "fs";
import { optimize } from "./optimize.js";
import { argv } from "process";
import { basename } from "path";

const path = argv[2];

if (!path || path.length == 0) {
  console.log(`Expected a SVG file.`);
  exit(-1);
}

let data = readFileSync(path, { encoding: "utf-8" });
let filename = basename(path);
let prefix = basename(path, ".svg");
writeFileSync(`_other/inkscape/${filename}`, data);
writeFileSync(`svg/${filename}`, optimize(prefix, data));
