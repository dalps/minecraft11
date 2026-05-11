import svgo from "svgo";

export function optimize(prefix, data) {
  data = data.replaceAll(
    "image-rendering:optimizeSpeed",
    "image-rendering:pixelated"
  );

  const optimized = svgo.optimize(data, {
    js2svg: { pretty: true, indent: 2 },

    plugins: [
      {
        name: "preset-default",
      },
      {
        name: "prefixIds",
        params: {
          prefix,
        },
      },
      {
        name: "addAttributesToSVGElement",
        params: {
          attributes: [{ viewBox: "0 0 256 256" }],
        },
      },
    ],
  });
  return optimized.data;
}
