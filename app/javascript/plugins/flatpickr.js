import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    minDate: "today",
    dateFormat: "d-m-Y",
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatpickr };
