module.exports = (item, _, paths) => {
  // console.dir(title)
  if (item.summary.includes(' Get ') || item.summary.includes(' Put ') || item.summary.includes(' Delete ')) {
    return [
      {
        message: `${paths.target.join('.')} - summary should not include "Get", "Put" or "Delete"`,
      }
    ]
  }
}
