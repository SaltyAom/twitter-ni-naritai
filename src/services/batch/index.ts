export const batch = (index: number, size = 25) => {
    const from = (index - 1) * size
    const to = index * size

    return { from, to }
}
