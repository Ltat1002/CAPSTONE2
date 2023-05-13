export const getReportById = (rpList, id) => {
  return rpList.find((rp) => rp.key === id);
};
